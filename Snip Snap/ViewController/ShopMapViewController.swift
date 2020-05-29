//
//  ShopMapViewController.swift
//  Snip Snap
//
//  Created by scarecode on 4/30/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit
import MapKit
import Apollo



class ShopMapViewController: UIViewController {

    
    @IBOutlet var mapView: MKMapView!
    
    private var addresses = [String]()
    private var annotations = [MKAnnotation]()
    let geocoder = CLGeocoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let address = "Bakersfield, California, United States"
        centerOnLocation(address: address)
        fetchShops()


    }

    func centerOnLocation(address: String){
        self.geocoder.geocodeAddressString(address) { (placemarkers, err) in
            if(err != nil){
                print(err!)
            }
            if let marks = placemarkers?.first{
                let coord = marks.location!.coordinate
                let viewRegion = MKCoordinateRegion(center: coord, latitudinalMeters: 100000,longitudinalMeters: 100000)
                self.mapView.setRegion(viewRegion, animated: true)
            }
        }
    }
    

    func showAnnotations(){
        self.mapView.addAnnotations(annotations)
    }
    
    
    func fetchShops(){
        
        NetworkManager.shared.apollo.fetch(query: AllshopsQuery()){ result in
              guard let data = try? result.get().data else { return }
            
            let json = data.jsonObject
            let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])
            
            // Deserialize the response
            let deserialized = try! JSONSerialization.jsonObject(with: serialized, options: []) as! JSONObject
            let ShopDetails = try! AllshopsQuery.Data(jsonObject: deserialized)
            for shops in ShopDetails.allshops{
                let shopdets = shops.fragments.shopDetails
                self.addresses.append(shopdets.streetAddr + ", " + shopdets.city + ", " + shopdets.state + ", " + shopdets.country)
                let annotation = MKPointAnnotation()
                let lat = (shopdets.latitude as NSString).doubleValue
                let lng = (shopdets.longitude as NSString).doubleValue
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                
                annotation.title = shopdets.shopId
                self.annotations.append(annotation)
                
                
            }
            self.showAnnotations()
        }
    }
    
    

}
