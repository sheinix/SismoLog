//
//  Constants.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

struct ApiKeys {
    static let googleMapsApiKey = "AIzaSyCd7ASIZ3tp4RzM0l1l1TOvO2Y1x8j2FqE"
}

struct Sesmi {
    static let baseRequest = "http://www.seismi.org/api/eqs"
    static let keyPath = "earthquakes"
}

struct CellIds {
    static let filterCellId = "FilterCellId"
}

struct NotificationIds {
    static let newData = "newDataId"
}

struct Colors {
     static let mainColor = UIColor(red: 226/255, green: 100/255, blue: 95/255, alpha: 0.9)
}
struct Fonts {
    static let mainFontBig    = UIFont(name: "Avenir-Light", size: 26)!
    static let mainFontMedium = UIFont(name: "Avenir-Light", size: 16)!
    static let mainFontSmall = UIFont(name: "Avenir-Light", size: 10)!
    
}

struct NumberConstants {
    
    static let maxEarthquakes = 900
    static let maxMinimumDepth : Float  = 650.0
    static let maxMinimumMagnitude : Float = 8.0
    static let tableSectionHeadersHeight : CGFloat = 60.0
    static let defaultMapMarkerCalloutViewSize : CGPoint = CGPoint(x: 0, y: 0)
}

