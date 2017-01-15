//
//  Parameters.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import Alamofire

let magnitudeStr = "min_magnitude"
let limitStr     = "limit"

struct apiParams {
    
    var magnitude : String?
    var limit : String?
    
    var paramList : Parameters {
        
        var dict = Dictionary<String, Any>()
        
        if self.magnitude != nil { dict[magnitudeStr] = self.magnitude }
        if self.limit != nil { dict[limitStr] = self.limit }
        
        return dict

    }
}
