//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Timotius Leonardo Lianoto on 15/02/23.
//

import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    
    func start()
}
