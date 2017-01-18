//
//  TableSectionHeaderView.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 16/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit
import SnapKit

class TableSectionHeaderView: HeaderView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.titleLabel.textColor = UIColor.darkGray
        self.titleLabel.font = Fonts.mainFontBig
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
