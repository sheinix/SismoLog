//
//  EarthquakeCalloutView.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 16/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit
import SnapKit

class CustomInfoWindow: UIView {
    
    @IBOutlet weak var regionTitle: UILabel!
    @IBOutlet weak var magnitudeTitle: UILabel!
    @IBOutlet weak var depthTitle: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    
    @IBOutlet weak var regionValue: UILabel!
    @IBOutlet weak var magnitudeValue: UILabel!
    @IBOutlet weak var depthValue: UILabel!
    @IBOutlet weak var dateValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public func setValuesWith(earthquake: Eartquake) {
        
        if let color = earthquake.severity?.color { self.magnitudeValue.textColor = color }
        
        if let region   = earthquake.region { self.regionValue.text = region }
        if let magnitud = earthquake.magnitude { self.magnitudeValue.text = magnitud }
        if let depth    = earthquake.depth { self.depthValue.text = depth }
        if let date     = earthquake.timedate { self.dateValue.text = date }
        
    }
}
