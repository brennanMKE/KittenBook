//
//  RootViewController.swift
//  KittenBook
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import UIKit

class RootViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if Application.current.loggedIn {
                // go immediately to listing
                self.performSegue(withIdentifier: "RootToListing", sender: self)
            }
            else {
                // go to intro screen
                self.performSegue(withIdentifier: "RootToIntro", sender: self)
            }
        }

    }

}
