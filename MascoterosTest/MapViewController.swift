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
    var summaryView  = SummaryView(frame: CGRect.zero)
    var filterButton = UIButton(type: .custom)
    var earthquakes : [Eartquake]?
    
    override func viewDidLoad() {

        super.viewDidLoad()

        setupViewElements()
        
        NotificationCenter.default.addObserver(self,
                                            selector:#selector(earthquakesListHasNewData),
                                                name: NSNotification.Name(rawValue: NotificationIds.newData),
                                              object: nil)
        
        NetworkManager.shared.getRecentEartquakes()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    
        super.viewWillDisappear(animated)
        self.summaryView.alpha = 0
    }
    
    fileprivate func setupViewElements() {
        
        self.navigationController?.navigationBar.isHidden = true
    
        filterButton.setImage(UIImage(named:"filter"), for: .normal)
        filterButton.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        filterButton.layer.cornerRadius = 6
        filterButton.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
        
        mapView.delegate = self
        mapView.addSubview(filterButton)
        mapView.addSubview(summaryView)
        
        //Set constraints:
        filterButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(25)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        summaryView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(25)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
    }
    
    
    @objc func showFilterView(selector: UIButton) {
        
        let filterViewController = FilterTableViewController()
            
        filterViewController.filterDelegate = self
            
        self.present(filterViewController, animated: true) { }
    }
    
    @objc func earthquakesListHasNewData(notification: NSNotification) {
        
        guard let list = notification.userInfo?["earthquakes"] as? [Eartquake] else { return }
        
        MapMarkerManager.shared.addMarkersFor(earthquakes: list, to: mapView)
        
        summaryView.setNew(count: list.count)
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
