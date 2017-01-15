//
//  MapFilter.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import Alamofire

struct DefaultFilterValues {
    
    static let magnitudeDefault           = "2.6"
    static let numberOfEarthquakesDefault = "300"
    static let depthDefault               = "2.6"
    static let yearDefault                = "2013"
    static let monthDefault               = "May"
}

struct MapFilter {
   
    var magnitude : String?
    var numberOfEarthquakes : String?
    var depth : String?
    var year : String?
    var month : String?
    
    var requestForApi : Router {
        
        get {
            let params = apiParams(magnitude: self.magnitude, limit: self.numberOfEarthquakes).paramList
            var request : Router
            
            if (year == nil) { request = Router.plain(parameters: params) }
                
            else if (month == nil) { request = Router.year(yearNumber: self.year!, parameters: params) }
                
            else { request = Router.month(yearNumber: self.year!, monthNumber: self.month!, parameters: params) }
            
            return request
        }
        
    }
    
    init() {
        
    }
    
    init(magnitude : String?, numberOfEarthquakes : String?, depth : String? , year : String?, month: String?) {
        
        self.magnitude = magnitude
        self.numberOfEarthquakes = numberOfEarthquakes
        self.depth = depth
        self.year = year
        self.month = month
    }
}
