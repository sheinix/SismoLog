//
//  EartquakeService.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

typealias CompletionHandler = (_ success:Bool, _ earthQuakes : [Eartquake]?) -> Void

public struct EartquakeService {
    
    static func request(routerRequest: Router, completionHandler : @escaping CompletionHandler) {
   
        //TODO set backgorund queue for completion handler!
        
        Alamofire.request(routerRequest).validate().responseArray(queue: nil, keyPath: "earthquakes", context: nil,  completionHandler: { (response : DataResponse<[Eartquake]>) in
            
            guard response.result.isSuccess else {
                
                print(response.result.error ?? "Not Succesful")
                completionHandler(false, nil)
                return
            }

            completionHandler(true, response.result.value)
            
        })
    }
}
