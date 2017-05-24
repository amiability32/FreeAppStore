//
//  ReviewContainerViewController.swift
//  FreeAppStore
//
//  Created by sally on 2017. 5. 23..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit

class ReviewContainerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var appId: String?
    var viewModel: ReviewListViewModel?
    @IBOutlet var reviewTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTableView.delegate = self
        reviewTableView.dataSource = self

        if let appId = appId {
            viewModel = ReviewListViewModel(appId: appId)
            viewModel?.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        
        print(viewModel.reviewList.count)
        return viewModel.reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewListCell", for: indexPath) as! ReviewListCell
        cell.load(review: viewModel.reviewList[indexPath.row])
        
        return cell
    }
}

extension ReviewContainerViewController: ViewModelDelegate {
    
    func reloadView() {
        reviewTableView.reloadData()
    }
}
