//
//  DynamicLinkCoordinator.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 21/02/23.
//

import Foundation
import UIKit

class DynamicLinkCoordinator: DynamicLinkCoordinating {
    weak var parentCoordinator: FirstCoordinator?
    var childCoordinators: [Coordinator] = []
    
    // Let it nil
    weak var navigationController: UINavigationController?
    
    init(firstCoordinator: FirstCoordinator) {
        self.parentCoordinator = firstCoordinator
    }
    
    func start() {
        //
    }
    
    func loginTapped() {
        parentCoordinator?.loginTapped()
    }
}
