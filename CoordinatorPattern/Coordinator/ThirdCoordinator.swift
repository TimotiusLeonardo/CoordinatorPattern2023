//
//  ThirdCoordinator.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 20/02/23.
//

import UIKit

class ThirdCoordinator: ThirdCoordinating {
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    
    func start() {
        
    }
}
