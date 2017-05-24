//
//  ReviewContainerViewController.swift
//  FreeAppStore
//
//  Created by sally on 2017. 5. 23..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit

class ReviewContainerViewController: UIViewController {
    
    var appId: String?
    var viewModel: ReviewListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let appId = appId {
            viewModel = ReviewListViewModel(appId: appId)
            viewModel?.delegate = self
        }
    }
}

extension ReviewContainerViewController: ViewModelDelegate {
    
    func reloadView() {
        print("reload")
    }
}
