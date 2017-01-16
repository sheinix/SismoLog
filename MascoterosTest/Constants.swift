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
//    static let baseRequest = "http://www.seismi.org/api/eqs"
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
}

struct NumberConstants {
    
    static let maxEarthquakes = 900
    static let maxMinimumMagnitude : Float = 8.0
}

enum Months : Int {
    
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
    
    static var count : Int { return 12 }
    var number : String! { return String(self.rawValue) }
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
        
        var yearsArray = [Int]()
        let currentYear : Int = Calendar.current.component(.year, from: Date())
        for year in 0...10 { yearsArray.append(currentYear-year) }
        
        return yearsArray
    }()
}

struct UserDefaultsKeys {
    static let didAskForRecentsKeys = "RecentsEarthquakes"
}
