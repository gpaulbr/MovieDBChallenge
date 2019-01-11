//
//  StoryboardInstantiable.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardInstantiable {
    
    /// viewController identifier inside storyboard file
    static var viewControllerID: String { get }
    /// storyboard bundle name
    static var storyboardBundle: Bundle? { get }
    /// storyboard file name
    static var storyboardIdentifier: String { get }
    
}

extension StoryboardInstantiable {
    
    static var storyboardBundle: Bundle? { return nil }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: storyboardBundle)
        
        guard let viewController =
            storyboard.instantiateViewController(withIdentifier: viewControllerID) as? Self else {
                
                fatalError("Could not instantiate \(self)")
        }
        return viewController
    }
    
}
