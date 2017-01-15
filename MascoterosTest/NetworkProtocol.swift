//
//  NetworkProtocol.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

protocol NetworkManagementProtocol: class {
    
    
    func getRecentEartquakes() //-> [Eartquake]
    
    func getEarthquakesWith(filter: MapFilter) //-> [Eartquake]
}
