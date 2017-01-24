//
//  DepthSlider.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 24/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation
import UIKit

protocol sliderProtocolDelegate : class {
    
    func sliderDidEndSlidingWith(value: Float)
}

class DepthSlider: UIView {
    
    var depthSlider : UISlider = {
        
        let slider = UISlider()
        slider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        slider.maximumValue = NumberConstants.maxMinimumDepth
        slider.minimumValue = 1
        slider.isContinuous = true
        slider.tintColor = Colors.mainColor
        slider.value = Float(NetworkManager.shared.filterData.minDepth ?? "1")!

        return slider
    }()
    
    var sliderLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = Fonts.mainFontSmall
        label.text = NetworkManager.shared.filterData.minDepth ?? "1.00"
        label.layer.cornerRadius = 9
        return label
    }()
    
    weak var delegate : sliderProtocolDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupViews() {
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.9)
        self.layer.cornerRadius = 9
        
        depthSlider.addTarget(self, action: #selector(depthSliderChanged), for: .valueChanged)
        depthSlider.addTarget(self, action: #selector(didEndSliding), for: .touchUpInside)
        self.clipsToBounds = false
     
        addSubview(depthSlider)
        addSubview(sliderLabel)
        
        depthSlider.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.height).multipliedBy(0.75)
            make.height.equalTo(self.snp.width).multipliedBy(0.8)
           
            make.centerY.equalTo(self.snp.centerY).offset(15)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        sliderLabel.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(5)
        }
    }
    
    @objc func depthSliderChanged(sender : UISlider) {
        
        sliderLabel.text = String(format: "%.2f", sender.value)
    }
    
    @objc func didEndSliding(sender: UISlider) {
        
        self.delegate?.sliderDidEndSlidingWith(value: sender.value)
        
    }
}
