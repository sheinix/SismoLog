//
//  Years.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 25/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

struct Years {
    
    static var years : [Int] = {
        
        var yearsArray = [0]
        let currentYear : Int = Calendar.current.component(.year, from: Date())
        for year in 0...10 { yearsArray.append(currentYear-year) }
        
        
        return yearsArray
    }()
}
