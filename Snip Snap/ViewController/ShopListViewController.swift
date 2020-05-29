//
//  ShopListViewController.swift
//  Snip Snap
//
//  Created by scarecode on 5/7/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit
import MapKit
import Apollo

class ShopListViewController: UIViewController  {
    
    

    let id = "cell"
    let segid = "toAppt"
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var tableView: UITableView!
    
    var cardData = [ShopDets]()
    var userCoords = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let address = "Bakersfield, CA, USA"
        centerOnLocation(address: address)
        setTabBar()
        
    }
    func centerOnLocation(address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarkers, err) in
            if(err != nil){
                print(err!)
            }
            if let marks = placemarkers?.first{
                self.userCoords = CLLocation(latitude: marks.location!.coordinate.latitude, longitude: marks.location!.coordinate.longitude)
            }
            self.fetchShops()
        }
    }
    
    func fetchShops() {

        NetworkManager.shared.fetchShops(userCoords: userCoords) { (data: [ShopDets]) in
            self.cardData = data
            self.cardData.sort{$0.distance < $1.distance}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func setTabBar(){
        let aTabArray: [UITabBarItem] = (self.tabBar.items)!

        for item in aTabArray {
            item.image = item.image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            item.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: -7, right: 0)
        }
        tabBar.selectedItem = tabBar.items![1]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segid{
            let destVC = segue.destination as! AppointmentViewController
            destVC.shopID = sender as! String
        }
    }


}
extension ShopListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardData.endIndex
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! ShopTableViewCell
        
        cell.setView(shopid: cardData[indexPath.row].shopID, position: indexPath.row+1, shopName: cardData[indexPath.row].shopName, shopAddress: cardData[indexPath.row].shopAddress, distance: cardData[indexPath.row].distance, rating: cardData[indexPath.row].ratings, numberofRatings: 8)
        cell.delegate = self
        
        return cell
    }



}
extension ShopListViewController:ShopPickerDelegate{
    func didTapNextButton(shopid: String) {
        performSegue(withIdentifier: segid, sender: shopid)
    }
}
