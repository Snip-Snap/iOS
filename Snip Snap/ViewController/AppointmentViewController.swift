//
//  AppointmentViewController.swift
//  Snip Snap
//
//  Created by scarecode on 5/12/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController {

    // all outlets
    @IBOutlet weak var timeCollectionView: UICollectionView!
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var servicePrice: UILabel!
    @IBOutlet weak var serviceNames: UILabel!
    @IBOutlet weak var serviceView: LoginView!
    @IBOutlet weak var serviceTime: UILabel!
    @IBOutlet weak var barberView: LoginView!
    @IBOutlet weak var barberNameLabel: UILabel!
    //
    
    // ids
    let id = "cell"
    let serviceSegue = "services"
    //
    
    
    //data
    var dates = [Date]()
    var selectedDate = 0
    var selectedTime = -1
    var shopID = String()
    var serviceData = [ServiceDetails]()
    var serviceSelected = [Int:Bool]()
    var apptData = [Int:[Date:[Int:Bool]]]()
    var bspData = [Int:String]()
    var selectedBarber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        fetchBarbersAtShop()
        fetchServices()
        
        //set up touch gesture for the services todo move to func
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedService))
        serviceView.addGestureRecognizer(tap)
    
        barberView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedBarber)))
        
       
        
        
    }
    func fetchBarbersAtShop(){
        NetworkManager.shared.fetchBarbersAtShop(shopid: shopID) { (data: [Int:String]) in
            self.bspData = data
            if let randomkey = self.bspData.randomElement()?.key{
                self.selectedBarber = randomkey
                self.barberNameLabel.text = self.bspData[self.selectedBarber]
            }
            
            //set up and get dates for those barbers
            self.setUpDates()
            self.setUpApptDefault()
            self.fetchAppointments()
            
        }
    }
    func fetchAppointments(){
        NetworkManager.shared.fetchAppointments(shopid: shopID) { (data: [ApptDetails]) in
            print("Fetching data")
            print(data)
            for d in data{
                if let bid = Int(d.barberId){
                    self.setupAppointmentTimeData(barberid: bid, data: d)
                }
            }
            DispatchQueue.main.async {
                self.timeCollectionView.reloadData()
                self.dateCollectionView.reloadData()
            }
            
        }
        
    }
    
    func fetchServices(){
        NetworkManager.shared.fetchServices { (data: [ServiceDetails]) in
            self.serviceData = data
        }
    }
    
    func setUpDates(){
        let today = Date()
        dates.append(today)
        for i in 1...5{
            dates.append(Calendar.current.date(byAdding: .day, value: i, to: today)!)
        }
    }
    
    func setUpApptDefault(){
        for (bid, _) in bspData{
            var temp = [Date:[Int:Bool]]()
            for date in dates{
                var subarray = [Int:Bool]()
                for i in 10...18{
                    subarray[i] = true
                }
                temp[date] = subarray
                
            }
            apptData[bid] = temp
        }
    }
    
    func setupAppointmentTimeData(barberid: Int, data: ApptDetails){

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let dateData = dateFormatter.date(from: data.apptDate) else { return }
        
        let sT = Int(data.startTime.prefix(2))
        if apptData[barberid] != nil{
            for date in dates{
                if Calendar.current.isDate(date, equalTo: dateData, toGranularity: .day){
                    apptData[barberid]?[date]?[sT!] = false
                }
            }
            return
           
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == serviceSegue{
            let destVC = segue.destination as! ServicesViewController
            destVC.serviceData = sender as! [ServiceDetails]
            destVC.rowsSelected = serviceSelected
        }
    }
    
    @objc func tappedBarber(){
        
        let actionSheet = UIAlertController(title: "Barbers", message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        for (bid, name) in bspData{
            let act = UIAlertAction(title: name, style: .default) { (UIAlertAction) in
                self.selectedBarber = bid
                self.barberNameLabel.text = name
                self.timeCollectionView.reloadData()
                self.selectedTime = -1
            }
            actionSheet.addAction(act)
        }
        actionSheet.addAction(cancel)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @objc func tappedService(){
        performSegue(withIdentifier: serviceSegue, sender: serviceData)
    }
    //unwind for services tableview and pass data back
    @IBAction func didUnWindService(_ sender: UIStoryboardSegue) {
        guard let service = sender.source as? ServicesViewController else {return}
        
        let rowschoosen = service.serviceTable.indexPathsForSelectedRows
        if let rows = rowschoosen{
            for r in rows{
                service.rowsSelected[r.row] = true
            }
        }
        serviceSelected = service.rowsSelected
        var priceTotal = Double(0.00)
        var servicespicked = ""
        for (key, _) in serviceSelected{
            priceTotal += serviceData[key].price ?? 0.00
            servicespicked += serviceData[key].serviceName.uppercased()
            servicespicked += ", "
        }
        if servicespicked == ""{
            serviceNames.text = "Click for Services"
        }else{
            servicespicked.removeLast(2)
            serviceNames.text = servicespicked
        }
        servicePrice.text = String(format: "$%.2f", priceTotal)
        
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bookButtonTapped(_ sender: Any) {
        if(serviceSelected.isEmpty || selectedTime == -1){
            let alertController = UIAlertController(title:"Please select a service(s) and/or time",message:nil,preferredStyle:.alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            self.present(alertController,animated:true,completion:nil)
        }else{
            let adate = String(dates[selectedDate].year) + "-" + String(dates[selectedDate].month) + "-" + String(dates[selectedDate].day)
            var commaservice = String()
            var commaprice = String()
            for (key, _) in serviceSelected{
                commaservice += serviceData[key].serviceId + ", "
                commaprice += String(format: "%.2f", serviceData[key].price!) + ", "
            }
            commaservice.removeLast(2)
            commaprice.removeLast(2)
            
            
            let input = ApptData(barberid: String(selectedBarber), clientUsername: UserDefaults.standard.string(forKey: "UserName")!, apptdate: adate, startTime: String(format: "%d:00:00",selectedTime+10), endTime: String(format: "%d:00:00",selectedTime+11), servicesids: commaservice, servicePrice: commaprice)
            
            NetworkManager.shared.insertAppointment(input: input) { (data: String) in
                
                if data != ""{
                    let alertController = UIAlertController(title:"Check you local device for receipt \(data)",message:nil,preferredStyle:.alert)
                    let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
                        self.selectedTime = -1
                        self.fetchAppointments()
                    }
                    alertController.addAction(cancel)
                    self.present(alertController,animated:true,completion:nil)
                }
                
            }
            
            
        }
    }
}
extension AppointmentViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == dateCollectionView){
            return dates.count
        }
        else{
            return apptData[selectedBarber]?[dates[selectedDate]]?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == dateCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! AppointmentDateCollectionViewCell
            let customDateFormatter = DateFormatter()
            let weekday = customDateFormatter.shortWeekdaySymbols[Calendar.current.component(.weekday, from: dates[indexPath.row])-1]
            cell.setUp(day: dates[indexPath.row].day, weekdaySym: weekday)
            //change the color of the selected cell
            if selectedDate == indexPath.row{
                cell.selectCell()
            }
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! TimeCollectionViewCell
            
            let timecell = String(format: "%.2f", Double(indexPath.row + 10))
            let cellvalid = apptData[selectedBarber]?[dates[selectedDate]]?[indexPath.row+10] ?? true
            cell.setUp(time: timecell, validcell: cellvalid)
            if selectedTime == indexPath.row{
                cell.selectCell()
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == dateCollectionView{
            selectedDate = indexPath.row
            selectedTime = -1
            dateCollectionView.reloadData()
            timeCollectionView.reloadData()
            serviceTime.text = "00:00-24:00"
        }else{
            let cellvalid = apptData[selectedBarber]?[dates[selectedDate]]?[indexPath.row+10] ?? true
            if cellvalid{
                selectedTime = indexPath.row
                serviceTime.text = String(format: "%.2f - %.2f", Double(selectedTime+10), Double(selectedTime+11))
                timeCollectionView.reloadData()
            }
            
        }
    }
    
    
}
