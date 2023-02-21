//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 15/02/23.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    weak var coordinator: SecondCoordinating?
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to second page", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(goToLoginPage), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        button.frame = view.frame
    }
    
    @objc func goToLoginPage() {
        coordinator?.goToLoginController()
    }
}
