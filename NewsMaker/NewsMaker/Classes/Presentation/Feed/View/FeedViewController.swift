//
//  FeedViewController.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    fileprivate struct Constants {
        static let footerHeight: CGFloat = 50.0
        static let title = "Новости"
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var loadingView: UIView!

    fileprivate let refreshControl = UIRefreshControl()
    fileprivate lazy var footerView: UIView = {
        let size = CGSize(width: UIScreen.main.bounds.width,
                          height: Constants.footerHeight)
        let frame = CGRect(origin: .zero,
                           size: size)
        let view = UIView(frame: frame)
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = .gray
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()

        return view
    }()

    var output: FeedViewOutput!
    var dataDisplayManager: FeedDataDisplayManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialState()
        output.viewIsReady()
    }

    private func setupTableView() {
        tableView.register(NewsFeedCell.self)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self,
                                 action: #selector(refreshControlPulled),
                                 for: .valueChanged)
        tableView.tableFooterView = footerView
        tableView.dataSource = dataDisplayManager
        tableView.delegate = dataDisplayManager
    }

    private func setupInitialState() {
        setupTableView()
        title = Constants.title
        loadingView.isHidden = true
        messageView.isHidden = true
        tableView.isHidden = true
    }

    @objc private func refreshControlPulled() {
        output.didPullRefresh()
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        output.didTapActionButton()
    }
}

extension FeedViewController: FeedViewInput {
    func stopRefreshing() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }

    func append(news: [BriefNewsModel]) {
        dataDisplayManager.append(news: news)
        tableView.reloadData()
    }

    func replace(news: [BriefNewsModel]) {
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
        messageView.isHidden = true
        tableView.isHidden = false
        
        dataDisplayManager.replace(news: news)
        tableView.reloadData()
        stopRefreshing()
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

    func showBottomSpinner() {
        footerView.isHidden = false
    }

    func hideBottomSpinner() {
        footerView.isHidden = true
    }
}

extension FeedViewController: FeedDataDisplayManagerDelegate {
    func willDisplayCell(at indexPath: IndexPath) {
        output.willDisplayModel(at: indexPath.row)
    }

    func didSelectNews(withIdentifier identifier: String) {
        output.didSelectNews(withIdentifier: identifier)
    }
}
