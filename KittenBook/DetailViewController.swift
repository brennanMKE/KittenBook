//
//  DetailViewController.swift
//  KittenBook
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import UIKit
import KittenBookKit

class DetailViewController: BaseViewController {

    var kitten: Kitten?

    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        if let kitten = kitten {
            title = kitten.title
            photoView.image = UIImage(named: kitten.filename)
            captionLabel.text = kitten.caption
        }
        else {
            title = "Kitten Book"
            photoView.image = nil
            captionLabel.text = nil
        }
    }

}
