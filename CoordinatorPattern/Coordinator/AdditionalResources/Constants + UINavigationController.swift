//
//  Constants.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 21/02/23.
//

import UIKit

extension UINavigationController {
    func dismissAnyPopup() {
        // If modal existed
        if let modalVC = self.presentedViewController {
            modalVC.dismiss(animated: true)
        }
    }
}
