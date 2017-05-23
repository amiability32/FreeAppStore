//
//  ScreenShotCollectionViewCell.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 14..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit

class ScreenShotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var screenShotImageView: UIImageView!
    
    func load(_ url: URL) {
        screenShotImageView.af_setImage(withURL: url)
    }
}
