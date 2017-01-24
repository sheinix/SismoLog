//
//  UIViewControllerExtension.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 24/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

extension UIViewController {
    
    
    func showAlertWith(titleStr: String, msg: String) {
        
        let alert = UIAlertController(title: titleStr,
                                    message: msg,
                            preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in }
        alert.addAction(okAction)
    
        self.present(alert, animated: true, completion:nil)
    }
}
