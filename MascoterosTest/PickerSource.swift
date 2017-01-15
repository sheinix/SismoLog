//
//  PickerSource.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 15/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

enum PickerSource : Int {
    
    case numberOfEarthquakes
    case Month
    case Year
    case total
    
    
    var numberOfRows : Int {
        
        switch self {
        case .numberOfEarthquakes:
            return NumberConstants.maxEarthquakes
        case .Month:
             return Months.count
        case .Year:
            return Years.years.count
        default:
            break
        }
        
        return 0
    }
        
    public func titleFor(row : Int) -> String! {
        
        switch self {
        case .Month: return Months(rawValue: row)?.name
        case .Year:  return String(Years.years[row])
        case .numberOfEarthquakes: return String(row)
        
        default: break
        }
        return ""
    }
    
    
}
