//
//  ReviewListViewModel.swift
//  FreeAppStore
//
//  Created by sally on 2017. 5. 24..
//  Copyright © 2017년 sally. All rights reserved.
//

import Foundation

class ReviewListViewModel{
    
    var delegate: ViewModelDelegate?
    
    private(set) var reviewList: [Review]
    
    private var model: ReviewListModel
    
    init(appId: String) {
        self.model = ReviewListModel(appId: appId)
        self.reviewList = model.reviewList
        
        subscribeToNotifications()
        model.load()
    }
    
    deinit {
        unsubscribeFromNotifications()
    }
    
    private func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reviewListDidChangeNotification(_:)),
                                               name: NSNotification.Name(rawValue: Notifications.ReviewListDidChange),
                                               object: model)
    }
    
    private func unsubscribeFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func reviewListDidChangeNotification(_ notification: NSNotification){
        self.reviewList = model.reviewList
        delegate?.reloadView()
    }
    
}
