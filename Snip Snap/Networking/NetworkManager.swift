//
//  NetworkManager.swift
//  Snip Snap
//
//  Created by scarecode on 4/24/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import Foundation
import Apollo
import CoreLocation

class NetworkManager {
    static let shared = NetworkManager()

    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://ec2-18-144-86-87.us-west-1.compute.amazonaws.com:8080/query")!)
    
    func fetchShops(userCoords: CLLocation , completion: @escaping ([ShopDets]) -> Void){
        
        apollo.fetch(query: AllshopsQuery()){ result in

            guard let data = try? result.get().data else { return }
            let json = data.jsonObject
            let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])

            // Deserialize the response
            let deserialized = try! JSONSerialization.jsonObject(with: serialized, options: []) as! JSONObject

            let ShopDetails = try! AllshopsQuery.Data(jsonObject: deserialized)
            var cardData = [ShopDets]()
            for dets in ShopDetails.allshops{
                cardData.append(ShopDets(shopjson: dets.fragments.shopDetails, userCoords: userCoords))
            }
            completion(cardData)
        }
    }
    
    func fetchServices(completion: @escaping ([ServiceDetails]) -> Void){
        
        apollo.fetch(query: ServicesQuery()){result in
            guard let data = try? result.get().data else {return}
            
            let json = data.jsonObject
            let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])
            
            //deserialize the resp
            let deserialized = try! JSONSerialization.jsonObject(with: serialized, options: []) as! JSONObject
            
            let serviceDets = try! ServicesQuery.Data(jsonObject: deserialized)
            
            var ret = [ServiceDetails]()
            for dets in serviceDets.services{
                ret.append(dets.fragments.serviceDetails)
            }
            
            completion(ret)
            
        }
        
    }
    func fetchAppointments(shopid: String, completion: @escaping ([ApptDetails]) -> Void){
        let sid = Shopidentifier(shopId: shopid)
        apollo.clearCache()
        apollo.fetch(query: WeeklyapptQuery(shopid: sid)){result in
            guard let data = try? result.get().data else {return}
            print(data)
            let json = data.jsonObject
            let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])
            
            //deserialize the resp
            let deserialized = try! JSONSerialization.jsonObject(with: serialized, options: []) as! JSONObject
            
            let apptDets = try! WeeklyapptQuery.Data(jsonObject: deserialized)
            
            var ret = [ApptDetails]()
            for dets in apptDets.weeklyAppt{
                ret.append(dets.fragments.apptDetails)
            }
            completion(ret)
        }
        
    }
    func fetchBarbersAtShop(shopid: String, completion: @escaping ([Int:String]) -> Void){
        let sid = Shopidentifier(shopId: shopid)
        apollo.fetch(query: BspQuery(shopid: sid)){result in
            guard let data = try? result.get().data else {return}
            
            let json = data.jsonObject
            let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])
            
            //deserialize the resp
            let deserialized = try! JSONSerialization.jsonObject(with: serialized, options: []) as! JSONObject
            
            let bspDets = try! BspQuery.Data(jsonObject: deserialized)
            
            var ret = [Int:String]()
            for dets in bspDets.barbersAtShop{
                let bid = Int(dets.fragments.bspDetails.barberId)
                if bid != nil{
                    ret[bid!] = (dets.fragments.bspDetails.firstName) + " " + (dets.fragments.bspDetails.lastName)
                }
            }
            completion(ret)
        }
    }
    func insertAppointment(input: ApptData, completion: @escaping ((String) -> Void)){
        apollo.perform(mutation: MakeApptMutation(data: input)){ result in
        
            switch result{
            case .success(let gqlresult):
                if let token = gqlresult.data?.makeAppt?.fragments.resDetails.okay{
                    if token == "okay"{
                        if (gqlresult.data?.makeAppt?.fragments.resDetails.id) != nil{
                            self.genReceipt(id: gqlresult.data?.makeAppt?.fragments.resDetails.id ?? "0") { (url: String) in
                                completion(url)
                            }
                        }
                        
                        completion("")
                    }
                    print(token)
                }else{
                    print(gqlresult.errors ?? "")
                }
            case .failure(let error):
                print("error \(error)")
            }
                
        }
        
    }
    
    func genReceipt(id: String, completion: @escaping ((String) -> Void)){
        apollo.fetch(query: ReceiptQuery(data: Receiptinput(apptId: id, clientId: "26"))){
            result in
            guard let data = try? result.get().data else {return}
            
            let json = data.jsonObject
            let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])
            
            //deserialize the resp
            let deserialized = try! JSONSerialization.jsonObject(with: serialized, options: []) as! JSONObject
            
            let ret = try! ReceiptQuery.Data(jsonObject: deserialized)
            


            completion(ret.receipt.fragments.urLdets.url)
        }
    }
    
    
}
