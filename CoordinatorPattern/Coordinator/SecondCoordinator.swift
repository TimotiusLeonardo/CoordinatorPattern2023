//
//  SecondCoordinator.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 20/02/23.
//

import UIKit
// import Feature

class SecondCoordinator: SecondCoordinating {
    weak var parentCoordinator: (Coordinator & Any)?
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let secondViewController = SecondViewController()
        secondViewController.coordinator = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func goToLoginController() {
        let loginContoller = LoginViewController()
        loginContoller.didLoginSuccess = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
            let parentCoordinator = self?.parentCoordinator as? FirstCoordinating
            parentCoordinator?.goToThirdPage()
        }
        navigationController?.pushViewController(loginContoller, animated: true)
    }
}
