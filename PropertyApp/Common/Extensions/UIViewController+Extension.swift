//
//  UIViewController+Extension.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 02/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(title: String = "", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
