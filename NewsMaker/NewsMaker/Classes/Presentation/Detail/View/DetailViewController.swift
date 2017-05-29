//
//  DetailViewController.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var loadingView: UIView!

    var output: DetailViewOutput!
    var dataDisplayManager: DetailDataDisplayManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialState()
        output.viewIsReady()
    }

    private func setupTableView() {
        tableView.register(NewsDetailTitleCell.self)
        tableView.register(NewsDetailTextCell.self)
        tableView.dataSource = dataDisplayManager
        tableView.delegate = dataDisplayManager
    }

    private func setupInitialState() {
        setupTableView()
        loadingView.isHidden = true
        messageView.isHidden = true
        tableView.isHidden = true
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        output.didTapActionButton()
    }
}

extension DetailViewController: DetailViewInput {

    func show(news: DetailNewsModel) {
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
        messageView.isHidden = true
        tableView.isHidden = false
        
        dataDisplayManager.show(news: news)
        tableView.reloadData()
    }

    func showLoading() {
        loadingView.isHidden = false
        messageView.isHidden = true
        tableView.isHidden = true
        activityIndicator.startAnimating()
    }

    func showMessage(_ description: String) {
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
        messageView.isHidden = false
        tableView.isHidden = true
        messageLabel.text = description
    }
}

extension DetailViewController: ModuleConfigurableProvider {
    var configurable: ModuleConfigurable? {
        return output as? ModuleConfigurable
    }
}
