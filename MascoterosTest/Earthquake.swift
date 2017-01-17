//
//  Earthquake.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import ObjectMapper

class Eartquake : Mappable {
    
    var earthQuakeId : String?
    var magnitude : String? {
        didSet {
            guard let value = magnitude else { return }
            severity = EearthquakeSeverity(magnitude: Double(value)!)
        }
    }
    var depth : String?
    var latitude : String?
    var longitude : String?
    var region : String?
    var src : String?
    var timedate : String?
    var year : Int?
    var month : Int?
    var severity : EearthquakeSeverity?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        
        earthQuakeId  <- map["eqid"]
        magnitude     <- map["magnitude"]
        depth         <- map["depth"]
        region        <- map["region"]
        src           <- map["src"]
        timedate      <- map["timedate"]
        latitude      <- map["lat"]
        longitude     <- map["lon"]
        
        
        //position = EarthquakeCoordinate(latitude: lat, longitude: lon)
    }
}
