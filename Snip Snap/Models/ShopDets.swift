//
//  ShopDetails.swift
//  Snip Snap
//
//  Created by scarecode on 5/10/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//


import CoreLocation

struct ShopDets {
    var shopID: String
    var shopAddress: String
    var shopName: String
    var ratings: Double
    var shopCity: String
    var shopState: String
    var distance: Double
    init(shopjson: ShopDetails, userCoords: CLLocation) {
        shopID = shopjson.shopId
        shopAddress = shopjson.streetAddr
        shopName = shopjson.shopName
        shopCity = shopjson.city
        shopState = shopjson.state
        ratings = shopjson.rating;
        let shopLoc = CLLocation(latitude: (shopjson.latitude as NSString).doubleValue, longitude: (shopjson.longitude as NSString).doubleValue)
        let dist = userCoords.distance(from: shopLoc)
        distance = dist/1609.344
    }
}
