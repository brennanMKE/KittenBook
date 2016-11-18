//
//  RegistrationViewController.swift
//  KittenBook
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func regsisterButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "RegistrationToListing", sender: self)
    }
    
}
