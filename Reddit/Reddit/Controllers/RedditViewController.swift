//
//  RedditViewController.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/23/21.
//

import UIKit
import SDWebImage

final class RedditViewController: UIViewController, UITableViewDelegate {
    private let viewModel: RedditViewModel = RedditViewModel()
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        indicator.color = UIColor.red
        return indicator
    }()
    
    
    private let tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(RedditTableViewCell.self,
                           forCellReuseIdentifier: "RedditTableViewCell")
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewElements()
        viewModel.feedData.bind { [weak self] feedList in
            DispatchQueue.main.async {
                self?.tableView.tableFooterView = nil
                if feedList != nil {
                    self?.tableView.reloadData()
                }
                self?.shouldDisplayActivityIndicator(false)
            }
        }
        viewModel.errorInfo.bind { [weak self] error in
            DispatchQueue.main.async {
                if let error: DataResponseError = error {
                    self?.populateAlertFor(error: error)
                }
                self?.shouldDisplayActivityIndicator(false)
            }
        }
        shouldDisplayActivityIndicator(true)
        fetchData()
    }
    
    private func configureViewElements() {
        //TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        //Activity indicator
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    private func shouldDisplayActivityIndicator(_ status: Bool) {
        if status {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
    
    private func createSpinnerForFooter() -> UIView {
        let footerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner: UIActivityIndicatorView = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    private func fetchData() {
        tableView.tableFooterView = createSpinnerForFooter()
        viewModel.fetchData()
    }
    
    private func populateAlertFor(error: DataResponseError) {
        let alert = UIAlertController(
          title: "Info",
            message: error.getErrorMessage(),
          preferredStyle: .alert)
        let submitAction = UIAlertAction(
          title: "Ok",
          style: .default)
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
}

extension RedditViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.feedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell: RedditTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RedditTableViewCell", for: indexPath) as! RedditTableViewCell
        let childData = viewModel.feedList[indexPath.row].data
        if let data: ChildData = childData {
            tableViewCell.setFeedInformation(childData: data)
        }
        return tableViewCell
    }
}

extension RedditViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            guard viewModel.canPaginate() else {
                return
            }
            fetchData()
        }
    }
}

