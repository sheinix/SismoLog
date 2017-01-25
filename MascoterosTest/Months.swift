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
            return  NSLocalizedString("JAN", comment: "")
        case .February:
            return NSLocalizedString("FEB", comment: "")
        case .March:
            return NSLocalizedString("MAR", comment: "")
        case .April:
            return NSLocalizedString("APR", comment: "")
        case .May:
            return NSLocalizedString("MAY", comment: "")
        case .June:
            return NSLocalizedString("JUN", comment: "")
        case .July:
            return NSLocalizedString("JUL", comment: "")
        case .August:
            return NSLocalizedString("AGO", comment: "")
        case .September:
            return NSLocalizedString("SEP", comment: "")
        case .October:
            return NSLocalizedString("OCT", comment: "")
        case .November:
            return NSLocalizedString("NOV", comment: "")
        case .December:
            return NSLocalizedString("DEC", comment: "")
        default:
            return ""
        }
        
    }
    
    static func getMonthFrom(string: String) -> Months? {
        
        switch string {
        case NSLocalizedString("JAN", comment: "") : return Months.January
        case NSLocalizedString("FEB", comment: "") : return Months.February
        case NSLocalizedString("MAR", comment: "") : return Months.March
        case NSLocalizedString("APR", comment: "") : return Months.April
        case NSLocalizedString("MAY", comment: "") : return Months.May
        case NSLocalizedString("JUN", comment: "") : return Months.June
        case NSLocalizedString("JUL", comment: "") : return Months.July
        case NSLocalizedString("AGO", comment: "") : return Months.August
        case NSLocalizedString("SEP", comment: "") : return Months.September
        case NSLocalizedString("OCT", comment: "") : return Months.October
        case NSLocalizedString("NOV", comment: "") : return Months.November
        case NSLocalizedString("DEC", comment: "") : return Months.December
            
        default:
            break
        }
        return nil
    }
}
