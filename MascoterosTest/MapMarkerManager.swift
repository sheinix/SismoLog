//
//  MapMarkerManager.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 16/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

private let sharedMapMarkerManager = MapMarkerManager()

class MapMarkerManager {
    
    class var shared: MapMarkerManager {
        
        return sharedMapMarkerManager
        
    }
    
    var markerList : [GMSMarker]?
    
    //TODO Set color to the markers :
    //

    public func addMarkersFor(earthquakes: [Eartquake]?, to map: GMSMapView) {
        
        guard let earthquakesList = earthquakes else { return }
        guard earthquakesList.count > 0 else { return }
        
        map.clear()
        
        for earthquake in earthquakesList {
            
            _ = markerFor(earthQuake: earthquake, in: map)
        }
    }
    
    public func markerFor(earthQuake: Eartquake, in map: GMSMapView) -> GMSMarker {
        
        let marker = markerFor(latitude: Double(earthQuake.latitude!)!,
                               longitude: Double(earthQuake.longitude!)!,
                               map: map)
        
      
        marker.icon = GMSMarker.markerImage(with: earthQuake.severity?.color)
    
        marker.title = earthQuake.region
        
        if let magnitude = earthQuake.magnitude {
            
            marker.snippet = "Magnitud : " + String(magnitude)
        }
        
        return marker
        
    }
    
    
    public func markerFor(latitude: CLLocationDegrees, longitude: CLLocationDegrees, map: GMSMapView) -> GMSMarker {
        
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        return markerFor(position: position, in: map)
        
    }
    
    public func markerFor(position: CLLocationCoordinate2D, in map: GMSMapView) -> GMSMarker {
        
        let marker = markerFor(position: position)
        marker.map = map
        
        return marker
    }
    
    public func markerFor(position: CLLocationCoordinate2D) -> GMSMarker {
        
        let marker = GMSMarker(position: position)
        
        marker.isFlat = true
        
        marker.appearAnimation = kGMSMarkerAnimationPop
        
        return marker
    }
}
