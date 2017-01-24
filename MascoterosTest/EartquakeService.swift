//
//  EartquakeService.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

typealias CompletionHandler = (_ success:Bool, _ objectList : [AnyObject]?) -> Void

public struct EartquakeService {
    
    static func request(routerRequest: Router, keyPath: String, completionHandler : @escaping CompletionHandler) {
   
        let queue = DispatchQueue(label: "com.Seismi.response-queue",
                                    qos: .utility,
                             attributes: [.concurrent])
        
    
        Alamofire.request(routerRequest).validate().responseArray(queue: queue, keyPath: keyPath, context: nil,  completionHandler: { (response : DataResponse<[Eartquake]>) in
            
            guard response.result.isSuccess else {
                
                print(response.result.error ?? "Not Succesful")
                
                DispatchQueue.main.async { completionHandler(false, nil) }
                
                return
            }
            
            DispatchQueue.main.async { completionHandler(true, response.result.value) }
            
        })
    }
}
