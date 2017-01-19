//
//  Constants.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import SystemConfiguration

struct ApiKeys {
    static let googleMapsApiKey = "AIzaSyCd7ASIZ3tp4RzM0l1l1TOvO2Y1x8j2FqE"
}

struct Sesmi {
    static let baseRequest = "http://www.seismi.org/api/eqs"
}

public struct EarthquakeCoordinate {
    
    var latitude : Double!
    var longitude : Double!
    
    init(latitude : Double, longitude : Double) {
        
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

public struct CellIds {
    static let filterCellId = "FilterCellId"
}

public struct NotificationIds {
    static let newData = "newDataId"
    static let noNetworkConnection = "noNetworkConnection"
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
    static let maxMinimumMagnitude : Float = 8.0
    static let tableSectionHeadersHeight : CGFloat = 60.0
    static let defaultMapMarkerCalloutViewSize : CGPoint = CGPoint(x: 0, y: 0)
}

enum Months : Int , EnumCollection {
    
    case January = 1, February, March, April, May, June, July, August, September, October, November, December, NoData
    
    var number : String! {
        
        let valueStr = String(self.rawValue)
        return (valueStr.characters.count == 1 ? "0"+valueStr : valueStr)
    }
   
    
    var name : String! {
        switch self {
        case .January:
            return "Enero"
        case .February:
            return "Febrero"
        case .March:
            return "Marzo"
        case .April:
            return "Abril"
        case .May:
            return "Mayo"
        case .June:
            return "Junio"
        case .July:
            return "Julio"
        case .August:
            return "Agosto"
        case .September:
            return "Septiembre"
        case .October:
            return "Octubre"
        case .November:
            return "Noviembre"
        case .December:
            return "Diciembre"
        default:
            return ""
        }
        
    }
    
    static func getMonthFrom(string: String) -> Months? {
        
        switch string {
            case "Enero": return Months.January
            case "Febrero": return Months.February
            case "Marzo": return Months.March
            case "Abril": return Months.April
            case "Mayo": return Months.May
            case "Junio": return Months.June
            case "Julio": return Months.July
            case "Agosto": return Months.August
            case "Septiembre": return Months.September
            case "Octubre"   : return Months.October
            case "Noviembre": return Months.November
            case "Diciembre": return Months.December
       
        default:
            break
        }
        return nil
    }
}

struct Years {
    
    static var years : [Int] = {
        
        var yearsArray = [0]
        let currentYear : Int = Calendar.current.component(.year, from: Date())
        for year in 0...10 { yearsArray.append(currentYear-year) }
        
    
        return yearsArray
    }()
}

struct Utilities {
    
    static func isNetworkAvailable() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
}

