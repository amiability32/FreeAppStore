//
//  AppListViewModel.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 12..
//  Copyright © 2017년 sally. All rights reserved.
//

import Foundation

class AppListViewModel{
    
    var delegate: ViewModelDelegate?
    
    private(set) var appList: [AppInfo]
    
    private var model: AppListModel
    
    init() {
        self.model = AppListModel()
        self.appList = model.appList
        
        subscribeToNotifications()
        model.load()
    }
    
    deinit {
        unsubscribeFromNotifications()
    }
    
    private func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appListDidChangeNotification(_:)),
                                               name: NSNotification.Name(rawValue: Notifications.AppListDidChange),
                                               object: model)
    }
    
    private func unsubscribeFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func appListDidChangeNotification(_ notification: NSNotification){
        self.appList = model.appList
        delegate?.reloadView()
    }
    
}
