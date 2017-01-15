//
//  TableHeaderView.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 15/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit
import SnapKit

class TableHeaderView: UIView {

    var titleLabel : UILabel = {
        
        let title = UILabel()
        title.textColor = UIColor.white
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 25)
        title.text = "Filtrar Terremotos"
        return title
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    
    
}
