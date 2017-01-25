//
//  MapFilter.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import Alamofire

struct MapFilter {
   
    var magnitude : String?
    var numberOfEarthquakes : String?
    var year : String?
    var month : String?
    var minDepth : String?
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
    
    var dateText : String {
        if let year = self.year, let month = self.month {
            return (Months(rawValue: Int(month)!)?.name)! + " " + year
        }
        return (self.year != nil ? self.year! : NSLocalizedString("RECENT", comment : ""))
    }
        
    init() {
        
    }
    
    init(magnitude : String?, numberOfEarthquakes : String?, year : String?, month: String?) {
        
        self.magnitude = magnitude
        self.numberOfEarthquakes = numberOfEarthquakes
        self.year = year
        self.month = month
    }
}
