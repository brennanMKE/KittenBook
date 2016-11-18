//
//  ListingViewController.swift
//  KittenBook
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import UIKit
import KittenBookKit

class ListingViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    private var kittens: [Kitten] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(tableView != nil)
        assert(tableView.delegate != nil)
        assert(tableView.dataSource != nil)
        assert(self == tableView.delegate as? ListingViewController)
        assert(self == tableView.dataSource as? ListingViewController)

        // TODO: change the constraints to use automatic height
        // tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 100
    }

    override func viewWillAppear(_ animated: Bool) {
        kittens.removeAll()
        kittens.append(contentsOf: Application.current.kittens)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        becomeRootViewController()
    }

    // MARK: - Navigation -

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let kittenCell = sender as? KittenCell,
            let indexPath = tableView.indexPath(for: kittenCell),
            let vc = segue.destination as? DetailViewController {
            if indexPath.row < kittens.count {
                let kitten = kittens[indexPath.row]
                vc.kitten = kitten
            }
        }
    }

    @IBAction func unwindToListing(segue: UIStoryboardSegue) {
        debugPrint("Unwind to Listing")
    }

    // MARK: - UITableViewDataSource -

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kittens.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KittenCell", for: indexPath)

        if indexPath.row < kittens.count {
            let kitten = kittens[indexPath.row]
            if let kittenCell = cell as? KittenCell {
                kittenCell.photoView.image = UIImage(named: kitten.filename)
                kittenCell.titleLabel.text = kitten.title
                kittenCell.captionLabel.text = kitten.caption
            }
        }

        return cell
    }

    // MARK: - UITableViewDelegate -

    // Note: There are no methods to implement yet.

}
