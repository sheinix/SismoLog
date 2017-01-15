//
//  EartquakeService.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

public typealias CompletionHandler = (_ success:Bool, _ earthQuakes : [Eartquake]?) -> Void

public struct EartquakeService {
    
    public static func request(routerRequest: Router, completionHandler : @escaping CompletionHandler) {
   
        Alamofire.request(routerRequest).validate().responseJSON { (response) in
            
            guard response.result.isSuccess else {
                
                    print(response.result.error ?? "Not Succesful")
                    completionHandler(false, nil)
                    return
            }
            
            completionHandler(true, parse(response: JSON(response.result.value!)))

        }
    }
    
    fileprivate static func parse(response : JSON) -> [Eartquake] {
       
        var listArray = [Eartquake]()
        let earthquakeList = response["earthquakes"].array
        
        for earthQuake in earthquakeList! {
            
            if let earthQuakeObj = Mapper<Eartquake>().map(JSONObject: earthQuake.dictionaryObject) {
                listArray.append(earthQuakeObj)
            }
        }
        
        return listArray
    }
}
