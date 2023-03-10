//
//  FirstViewController.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 15/02/23.
//

import Foundation
import UIKit
// import CoordinatorCore

class FirstViewController: UIViewController {
    
    var coordinator: (Coordinator & FirstCoordinating)?
    
    private lazy var progStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to second page", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(goToSecodPageAction), for: .touchUpInside)
        return button
    }()
    
    lazy var thirdPageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to third page", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(goToThirdPageAction), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
//        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(progStackView)
        progStackView.addArrangedSubview(button)
        progStackView.addArrangedSubview(thirdPageButton)
        progStackView.addArrangedSubview(loginButton)
        
        progStackView.frame = view.frame
        
        
        // COBA TRIGGER NOTIFIKASI
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.coordinator?.loginTappedTRIGGER()
        }
        
        title = "First View Controller"
    }
    
    @objc func goToSecodPageAction() {
        coordinator?.goToSecondPage()
    }
    
    @objc func goToThirdPageAction() {
        coordinator?.goToThirdPage()
    }
    
//    @objc func loginTapped() {
//        coordinator?.loginTappedTRIGGER()
//    }
}
