//
//  NetworkManager.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

private let sharedNetworkManager = NetworkManager()

class NetworkManager: NetworkManagementProtocol {
    
    class var shared: NetworkManager {
        
        return sharedNetworkManager
        
    }
    
    //MARK : - Protocol Methods
    
    func getRecentEartquakes() {
        
        let dummyFilter = MapFilter()
        
        getEarthquakesWith(filter: dummyFilter)
    }
    
    func  getEarthquakesWith(filter: MapFilter) {
        
        let request = filter.requestForApi
        
        EartquakeService.request(routerRequest: request, completionHandler: { (success, earthQuakes) -> Void in
            
            guard (success) else { return }
            guard let earthQuakesResult = earthQuakes else { return }
            if earthQuakesResult.count <= 0 { return }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIds.newData),
                                            object: nil,
                                            userInfo: ["earthquakes": earthQuakesResult])
        })
        
    }
    
}
