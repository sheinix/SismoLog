//
//  Earthquake.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import ObjectMapper

class Eartquake : NSObject, Mappable {
    
    var earthQuakeId : String?
    var magnitude : Double? {
        didSet {
            guard let value = magnitude else { return }
            severity = EearthquakeSeverity(magnitude: value)
        }
    }
    var depth : Double = 0
    //var position : EarthquakeCoordinate?
    var latitude : String?
    var longitude : String?
    var region : String?
    var src : String?
    var timedate : String?
    var year : Int?
    var month : Int?
    var severity : EearthquakeSeverity?
    
    
//    required public init(timedate : String, src : String, region: String, latitude: String, longitude: String, earthquakeId : String) {
//        
//        self.earthQuakeId = earthquakeId
//    //    self.magnitude    = magnitude
//     //   self.depth        = depth
//        self.latitude     = latitude
//        self.longitude    = longitude
//        self.region       = region
//        self.src          = src
//        self.timedate     = timedate
//        //self.severity = EearthquakeSeverity(magnitude: Double(self.magnitude))
//        
//        //TODO get year month
//    }
//    
//    convenience init() {
//        self.init(timedate : "", src : "", region: "", latitude: "", longitude: "", earthquakeId : "")
//    }
    
    required init?(map: Map) {
//        self.init()
  //      mapping(map: map)
    }
    
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
