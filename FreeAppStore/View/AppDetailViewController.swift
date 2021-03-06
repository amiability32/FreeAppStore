//
//  AppDetailViewController.swift
//  FreeAppStore
//
//  Created by sally on 2017. 5. 22..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit
import Cosmos

class AppDetailViewController: UIViewController {

    var appId: String?
    var viewModel: AppDetailViewModel?
    
    var detailContainverViewController: DetailContainerViewController?
    var reviewContainerViewController: ReviewContainerViewController?
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var starRatingView: CosmosView!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var detailContainerView: UIView!
    @IBOutlet var reviewContainerView: UIView!
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            detailContainerView.isHidden = false
            reviewContainerView.isHidden = true
        case 1:
            detailContainerView.isHidden = true
            reviewContainerView.isHidden = false
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appId = appId {
            viewModel = AppDetailViewModel(appId: appId)
            viewModel?.delegate = self
        }
        
        detailContainerView.isHidden = false
        reviewContainerView.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailView") {
            detailContainverViewController = segue.destination as? DetailContainerViewController
            detailContainverViewController?.appId = self.appId
        } else if (segue.identifier == "reviewView") {
            reviewContainerViewController = segue.destination as? ReviewContainerViewController
            reviewContainerViewController?.appId = self.appId
        }
    }
}

extension AppDetailViewController: ViewModelDelegate{
    
    func reloadView() {
        setTitleView()
    }
    
    private func setTitleView() {
        guard let viewModel = viewModel else { return }
        
        iconImageView.setRounded()
        iconImageView.af_setImage(withURL: viewModel.icon!)
        nameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        starRatingView.rating = viewModel.starRating!
        starRatingView.text = "(\(viewModel.ratingCount!))"
    }
}
