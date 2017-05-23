//
//  UIImageView+Theme.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 14..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 0.5
    }
}
