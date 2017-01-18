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

    var totalCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = Fonts.mainFontSmall
        label.text = "Total de Terremotos : "
        return label
    }()
    
    var totalCountValue : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = Fonts.mainFontSmall
        label.text = ""
        return label
    }()
    
    var dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = Fonts.mainFontSmall
        label.text = "Fecha : "
        return label
    }()
    
    var dateLabelValue : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = ""
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
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
        
        totalCountLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(130)
            make.height.equalTo(18)
        }
        
        totalCountValue.snp.makeConstraints { (make) in
            make.left.equalTo(totalCountLabel.snp.right).offset(5)
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(18)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.top.equalTo(totalCountLabel.snp.bottom).offset(10)
            make.width.equalTo(70)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        dateLabelValue.snp.makeConstraints { (make) in
            make.left.equalTo(dateLabel.snp.right).offset(5)
            make.top.equalTo(totalCountValue.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    public func setNew(count: Int) {
        
        UIView.animate(withDuration: 3.0) {
            self.alpha = 0
            self.totalCountValue.text? = String(count)
            self.dateLabelValue.text?  = (NetworkManager.shared.filterData.dateText )
            self.alpha = 0.9
        }
        
        
        
    }
    
}
