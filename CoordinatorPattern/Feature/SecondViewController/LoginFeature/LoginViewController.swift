//
//  LoginViewController.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 20/02/23.
//

import UIKit
// import CoordinatorCore

class LoginViewController: UIViewController {
    
    var didLoginSuccess: (() -> Void)?
    
    private lazy var progStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Login!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(progStackView)
        progStackView.addArrangedSubview(button)
        
        progStackView.frame = view.frame
        
        title = "Login View Controller"
    }
    
    @objc func loginTapped() {
        didLoginSuccess?()
    }
}
