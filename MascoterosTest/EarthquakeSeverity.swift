//
//  EarthquakeSeverity.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 16/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

enum EearthquakeSeverity : Int {
    
    case light
    case normal
    case dangerous
    
    
    init?(magnitude: Double) {
        
        switch magnitude {
        
            case 0...3 : self = .light
            case 3...6 : self = .normal
            //case 6...10: self = .dangerous
            default: self = .dangerous
        }
    }
    
    public var color : UIColor! {
        
        switch self {
        case .light:
            return UIColor.green
        case .normal:
            return UIColor.orange
        case .dangerous:
            return UIColor.red
        }
    }
    
    
}

