//
//  TableHeaderView.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 15/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit
import SnapKit

class TableHeaderView: HeaderView {

    var closeButton : UIButton = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named:"down-arrow"), for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Colors.mainColor
        self.titleLabel.textColor = .white
        self.titleLabel.font = Fonts.mainFontBig
        self.titleLabel.text = NSLocalizedString("FILTER_EARTHQUAKES", comment: "")
        
        
        addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(50)

        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    
    
}
