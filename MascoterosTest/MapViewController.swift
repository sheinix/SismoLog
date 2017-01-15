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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setupViewElements()
        
        NetworkManager.shared.getRecentEartquakes()
    }

    
    
    fileprivate func setupViewElements() {
        
        self.navigationController?.navigationBar.isHidden = true
    
        filterButton.setImage(UIImage(named:"filter"), for: .normal)
        filterButton.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
        
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
}

extension MapViewController : FilterProtocolDelegate {

    func didApply(filter: MapFilter, completion: () -> Void) {

        print(filter)
        completion()
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
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
}
