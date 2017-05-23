//
//  AppDetailViewController.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit
import Cosmos
import AlamofireImage

class AppDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var appId: String?
    var viewModel: AppDetailViewModel?
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var starRatingView: CosmosView!
    
    @IBOutlet var screenShotCollectionView: UICollectionView!
    
    @IBOutlet var descriptionTitleLabel: UILabel!
    @IBOutlet var descriptioncontentLabel: UILabel!
    
    @IBOutlet var sellerNameLabel: UILabel!
    @IBOutlet var updateLabel: UILabel!
    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var minimumOSLabel: UILabel!
    
    @IBOutlet var descriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet var descriptionVerticalConstraint: NSLayoutConstraint!
    
    @IBOutlet var moreButton: UIButton!
    @IBAction func moreButtonAction(_ sender: Any) {
        expendDescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenShotCollectionView.delegate = self
        screenShotCollectionView.dataSource = self
        
        if let appId = appId {
            viewModel = AppDetailViewModel(appId: appId)
            viewModel?.delegate = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let screenShots = viewModel?.screenShots else { return 0 }
        
        return screenShots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let screenShots = viewModel?.screenShots else { return UICollectionViewCell()}
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenShotCollectionViewCell", for: indexPath) as? ScreenShotCollectionViewCell {
            cell.load(screenShots[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    private func expendDescriptionView() {
        descriptioncontentLabel.numberOfLines = 100
        descriptioncontentLabel.sizeToFit()
        descriptionHeightConstraint.constant = descriptionTitleLabel.frame.height + descriptionVerticalConstraint.constant + descriptioncontentLabel.frame.height
        
        moreButton.isHidden = true
    }
}

extension AppDetailViewController: ViewModelDelegate{
    
    func reloadView() {
        setTitleView()
        setScreenShotView()
        setDescriptionView()
        setInfoView()
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
    
    private func setScreenShotView() {
        screenShotCollectionView.reloadData()
    }
    
    private func setDescriptionView() {
        guard let viewModel = viewModel else { return }
        
        descriptioncontentLabel.text = viewModel.description
    }
    
    private func setInfoView() {
        guard let viewModel = viewModel else { return }
        
        let MARGIN = "     "
        sellerNameLabel.text = "개발자" + MARGIN + viewModel.sellerName!
        updateLabel.text = "업데이트" + MARGIN + viewModel.updateDate!
        versionLabel.text = "버전" + MARGIN + viewModel.version!
        ratingLabel.text = "등급" + MARGIN + viewModel.rating!
        minimumOSLabel.text = "최소 버전" + MARGIN +  viewModel.minimumOSVersion!
    }
}
