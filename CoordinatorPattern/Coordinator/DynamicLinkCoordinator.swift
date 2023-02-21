//
//  DynamicLinkCoordinator.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 21/02/23.
//

import Foundation
import UIKit

class DynamicLinkCoordinator: DynamicLinkCoordinating {
    var parentCoordinator: FirstCoordinator
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?, firstCoordinator: FirstCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = firstCoordinator
    }
    
    func start() {
        //
    }
}
