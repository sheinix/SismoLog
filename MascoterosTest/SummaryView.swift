//
//  SummaryView.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 17/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit
import SnapKit

class SummaryView: UIView {

    var totalCountLabel  = SummaryViewLabel(font: Fonts.mainFontSmall, txt: "Total de Terremotos")
    var totalCountValue  = SummaryViewLabel(font: Fonts.mainFontSmall, txt: "")
    
    var dateLabel        = SummaryViewLabel(font: Fonts.mainFontSmall, txt: "Fecha : ")
    var dateLabelValue   = SummaryViewLabel(font: UIFont.systemFont(ofSize: 10), txt: "")
    
    var depthLabel      = SummaryViewLabel(font: UIFont.systemFont(ofSize: 10), txt: "Profudidad Minima : ")
    var depthLabelValue = SummaryViewLabel(font: UIFont.systemFont(ofSize: 10), txt: "1")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    fileprivate func setupView() {
        self.alpha = 0
        self.backgroundColor = UIColor.darkGray
        self.layer.cornerRadius = 6
        
        addSubview(totalCountLabel)
        addSubview(dateLabel)
        addSubview(totalCountValue)
        addSubview(dateLabelValue)
        addSubview(depthLabel)
        addSubview(depthLabelValue)
        
        totalCountLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(130)
            make.height.equalTo(15)
        }
        
        totalCountValue.snp.makeConstraints { (make) in
            make.left.equalTo(totalCountLabel.snp.right).offset(5)
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(15)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.top.equalTo(totalCountLabel.snp.bottom).offset(6)
            make.width.equalTo(70)
        }
        
        dateLabelValue.snp.makeConstraints { (make) in
            make.left.equalTo(dateLabel.snp.right).offset(5)
            make.top.equalTo(totalCountValue.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-5)
        }
        
        depthLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.top.equalTo(dateLabel.snp.bottom).offset(6)
            make.width.equalTo(100)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        depthLabelValue.snp.makeConstraints { (make) in
            make.left.equalTo(depthLabel.snp.right).offset(5)
            make.top.equalTo(dateLabelValue.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-10)
        }

    }
    
    public func setNew(count: Int, resetDepth: Bool) {
        
        UIView.animate(withDuration: 3.0) {
            self.alpha = 0
            self.totalCountValue.text? = String(count)
            self.dateLabelValue.text?  = NetworkManager.shared.filterData.dateText
            self.depthLabelValue.text? = (resetDepth ? "1" : NetworkManager.shared.filterData.minDepth ?? "1")
            self.alpha = 0.9
        }
        
        
        
    }
    
}
