//
//  BaseViewController.swift
//  KittenBook
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    func becomeRootViewController() {
        guard let nc = navigationController else {
            return
        }

        // make Listing the root view controller if it is not to eliminate back button
        if nc.viewControllers.first != self {
            nc.setViewControllers([self], animated: false)
        }
    }

}
