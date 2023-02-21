//
//  SecondCoordinator.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 20/02/23.
//

import UIKit
// import Feature

class SecondCoordinator: NSObject, SecondCoordinating {
    weak var parentCoordinator: (Coordinator & Any)?
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    
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
            guard let self = self else { return }
            self.navigationController?.popToRootViewController(animated: true)
            let parentCoordinator = self.parentCoordinator as? FirstCoordinating
            parentCoordinator?.goToThirdPage()
            parentCoordinator?.childDidFinish(self)
        }
        navigationController?.pushViewController(loginContoller, animated: true)
    }
    
    deinit {
        print("Second Coordinator dismissed")
    }
}
