//
//  SummaryViewLabel.swift
//  
//
//  Created by Sarah Cleland on 25/01/17.
//
//

import UIKit

class SummaryViewLabel: UILabel {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    convenience init(font: UIFont, txt: String) {
        
        self.init(frame: CGRect.zero)
        
        self.textColor = .white
        self.textAlignment = .left
        self.font = font
        
        self.text = txt
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


}
