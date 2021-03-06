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
    
    fileprivate var markers = [GMSMarker]()
    
    public func addMarkersFor(earthquakes: [Eartquake]?, to map: GMSMapView) {
        
        guard let earthquakesList = earthquakes else { return }
        
        map.clear()
        markers.removeAll()
       
        guard earthquakesList.count > 0 else { return }
        
        for earthquake in earthquakesList {
            
            let marker = markerFor(earthQuake: earthquake, in: map)
            markers.append(marker)
           
        }
    }
    
    public func markerFor(earthQuake: Eartquake, in map: GMSMapView) -> GMSMarker {
        
        let marker = markerFor(latitude: Double(earthQuake.latitude!)!,
                               longitude: Double(earthQuake.longitude!)!,
                               map: map)
        
      
        marker.icon = GMSMarker.markerImage(with: earthQuake.severity?.color)
        marker.infoWindowAnchor = NumberConstants.defaultMapMarkerCalloutViewSize
        marker.userData = earthQuake
        
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
    
    public func filterMapMarkersIn(mapView: GMSMapView, with depth: Float) -> Int {
        
        //Vuelvo a agregar al mapa si filtre anteriormente :
        let _ = self.markers.filter { $0.map == nil }.map { $0.map = mapView }
        
        //Aplico filtro nuevo:
        let filtered = self.markers.filter { Float(($0.userData as! Eartquake).depth!)! <= depth }.map { $0.map = nil }
        
        return self.markers.count - filtered.count
    }
}
