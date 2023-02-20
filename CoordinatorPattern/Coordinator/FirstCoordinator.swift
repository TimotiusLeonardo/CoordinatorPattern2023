//
//  FirstCoordinator.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 15/02/23.
//

import UIKit
// import CoordinatorCore
// import Feature

class FirstCoordinator: FirstCoordinating {
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController: FirstViewController = FirstViewController()
        firstViewController.coordinator = self
        navigationController?.pushViewController(firstViewController, animated: false)
    }
    
    func goToSecondPage() {
        /// When second page dont have own coordinator
        // let secondPage: SecondViewController = SecondViewController()
        // navigationController?.pushViewController(secondPage, animated: true)
        
        /// When second page have coordinator
        let secondPageController = SecondCoordinator(navigationController: navigationController)
        secondPageController.parentCoordinator = self
        secondPageController.start()
    }
    
    func goToThirdPage() {
        /// When third page dont have own coordinator
        let thirdPage: ThirdViewController = ThirdViewController()
        navigationController?.pushViewController(thirdPage, animated: true)
    }
    
}
