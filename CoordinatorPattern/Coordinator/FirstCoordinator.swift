//
//  FirstCoordinator.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 15/02/23.
//

import UIKit
// import CoordinatorCore
// import Feature

class FirstCoordinator: NSObject, FirstCoordinating {
    // use this variable to coordinate when user click dynamic link
    var dynamicLinkCoordinator: DynamicLinkCoordinator?
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController: FirstViewController = FirstViewController()
        firstViewController.coordinator = self
        dynamicLinkCoordinator = DynamicLinkCoordinator(navigationController: navigationController, firstCoordinator: self)
        navigationController?.pushViewController(firstViewController, animated: false)
        navigationController?.delegate = self
    }
    
    func goToSecondPage() {
        /// When second page dont have own coordinator
        // let secondPage: SecondViewController = SecondViewController()
        // navigationController?.pushViewController(secondPage, animated: true)
        
        /// When second page have coordinator
        let secondPageCoordinator = SecondCoordinator(navigationController: navigationController)
        secondPageCoordinator.parentCoordinator = self
        /// If you want to add child reference to parent, to MAKE IT ALIVE
        childCoordinators.append(secondPageCoordinator)
        secondPageCoordinator.start()
    }
    
    func goToThirdPage() {
        /// When third page dont have own coordinator
        let thirdPage: ThirdViewController = ThirdViewController()
        navigationController?.pushViewController(thirdPage, animated: true)
    }
    
}

extension FirstCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        if let secondViewController = fromViewController as? SecondViewController {
            // We're popping a buy view controller; end its coordinator
            childDidFinish(secondViewController.coordinator)
        }
    }
}
