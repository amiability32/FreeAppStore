//
//  AppDetailViewModel.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import Foundation

class AppDetailViewModel {

    var delegate: ViewModelDelegate?
    
    private(set) var name: String? = nil
    private(set) var artistName: String? = nil
    private(set) var icon: URL? = nil
    private(set) var starRating: Double? = nil
    private(set) var ratingCount: Int? = nil
    private(set) var screenShots: [URL]? = nil
    private(set) var description: String? = nil
    private(set) var sellerName: String? = nil
    private(set) var updateDate: String? = nil
    private(set) var version: String? = nil
    private(set) var rating: String? = nil
    private(set) var minimumOSVersion: String? = nil
    
    private var model: AppDetailModel
    private var appId: String?
    private var appDetail: AppDetail?
    
    init(appId: String) {
        self.appId = appId
        self.model = AppDetailModel(appId: appId)
        self.appDetail = model.appDetail
        
        subscribeToNotifications()
        model.load()
    }
    
    deinit {
        unsubscribeFromNotifications()
    }
    
    private func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appListDidChangeNotification(_:)),
                                               name: NSNotification.Name(rawValue: Notifications.AppDetailDidChange),
                                               object: model)
    }
    
    private func unsubscribeFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func appListDidChangeNotification(_ notification: NSNotification){
        guard let appDetail = model.appDetail else { return }
        
        self.appDetail = appDetail
        self.name = appDetail.name
        self.artistName = appDetail.artistName
        self.icon = URL(string: appDetail.iconUrl)
        self.starRating = appDetail.starRating
        self.ratingCount = appDetail.ratingCount
        self.description = appDetail.description
        
        self.screenShots = [URL]()
        for urlItem in appDetail.screenShotUrl {
            self.screenShots?.append(URL(string: urlItem)!)
        }
        
        self.sellerName = appDetail.sellerName
        self.updateDate = appDetail.updateDate.components(separatedBy: "T")[0]
        self.version = appDetail.version
        self.rating = appDetail.rating
        self.minimumOSVersion = "iOS \(appDetail.minimumOSVersion) 버전 이상이 필요"
        
        delegate?.reloadView()
    }
    
}
