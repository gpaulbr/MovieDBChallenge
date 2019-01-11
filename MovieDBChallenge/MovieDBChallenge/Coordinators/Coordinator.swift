//
//  Coordinator.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childrenCoordinators: [Coordinator] { get set }
    func start()
    func addChild(coordinator: Coordinator)
    func releaseChild(coordinator: Coordinator)
}

protocol CoordinatorDelegate: class {
    func shouldDeinitCoordinator(_ coordinator: Coordinator)
}

extension Coordinator {
    
    func addChild(coordinator: Coordinator) {
        childrenCoordinators.append(coordinator)
    }
    
    func releaseChild(coordinator: Coordinator) {
        childrenCoordinators.removeAll()
    }
}

