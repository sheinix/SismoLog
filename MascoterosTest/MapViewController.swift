//
//  MapViewController.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit
import SnapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    var filterButton = UIButton(type: .custom)
    let locationManager = CLLocationManager()
    var earthquakes : [Eartquake]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        setupViewElements()
        
        NotificationCenter.default.addObserver(self,
                                            selector:#selector(earthquakesListHasNewData),
                                                name: NSNotification.Name(rawValue: NotificationIds.newData),
                                              object: nil)
        
        firstLaunch()
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//    }
    fileprivate func firstLaunch() {
        
        guard UserDefaults.standard.bool(forKey: UserDefaultsKeys.didAskForRecentsKeys) else {
            
            NetworkManager.shared.getRecentEartquakes()
            
          //  UserDefaults.standard.set(true, forKey: UserDefaultsKeys.didAskForRecentsKeys)
           // UserDefaults.standard.synchronize()
            
            return
        }
    }
    
    fileprivate func setupViewElements() {
        
        self.navigationController?.navigationBar.isHidden = true
    
        filterButton.setImage(UIImage(named:"filter"), for: .normal)
        filterButton.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
        
        mapView.delegate = self
        mapView.addSubview(filterButton)
        
        filterButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
    
    
    @objc func showFilterView(selector: UIButton) {
        
        let filterViewController = FilterTableViewController()
            
        filterViewController.filterDelegate = self
            
        self.present(filterViewController, animated: true) { }
    }
    
    @objc func earthquakesListHasNewData(notification: NSNotification) {
        
        let list = notification.userInfo?["earthquakes"] as! [Eartquake]
        
        list.count == 0 ? mapView.clear() : MapMarkerManager.shared.addMarkersFor(earthquakes: list, to: mapView)
    }
}

extension MapViewController : FilterProtocolDelegate {

    func didApply(completion: () -> Void) {
        
        completion()
    }
}
extension MapViewController : GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        guard let infoView : CustomInfoWindow = (Bundle.main.loadNibNamed("InfoWindow", owner: self, options: nil)?[0] as? CustomInfoWindow) else { return nil }
        
        guard let earthquake = marker.userData as? Eartquake else { return nil }
        
        infoView.frame = CGRect(origin: marker.infoWindowAnchor, size: CGSize(width: 250, height: 140))
        infoView.setValuesWith(earthquake: earthquake)
        
        return infoView
        
    }

}
extension MapViewController: CLLocationManagerDelegate {
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    
        if status == .authorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        if let location = locations.first {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 2, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
