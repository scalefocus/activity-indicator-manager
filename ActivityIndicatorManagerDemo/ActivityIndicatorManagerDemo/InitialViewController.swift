//
//  InitialViewController.swift
//  ActivityIndicatorManagerDemo
//
//  Created by Dimitar V. Petrov on 25.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

typealias Option = (title: String, controller: UIViewController.Type)

class InitialViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    
    let options: [Option] = [
        ("Whole window loader", WindowLoaderViewController.self),
        ("Specific view loader", ViewLoaderViewController.self),
        ("Window Loader with configured layout", LoaderConfigurationViewController.self),
        ("Window Loader in custom window", CustomWindowLoaderViewController.self)
    ]
    
}

// MARK: - UITableViewDataSource
extension InitialViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row].title
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension InitialViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = options[indexPath.row].controller.init()
        vc.title = options[indexPath.row].title
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
