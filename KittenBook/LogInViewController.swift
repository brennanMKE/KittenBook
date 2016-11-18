//
//  LogInViewController.swift
//  KittenBook
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import UIKit

class LogInViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logInButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "LogInToListing", sender: self)
    }
    
}
