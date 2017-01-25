//
//  Months.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 25/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

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
