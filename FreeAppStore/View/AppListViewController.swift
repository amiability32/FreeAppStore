//
//  AppListViewController.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 10..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit

class AppListViewController: UITableViewController {
    
    var viewModel = AppListViewModel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewModel.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.appList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppListCell", for: indexPath) as! AppListCell
        cell.load(id: indexPath.row + 1, viewModel.appList[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        if segue.identifier == "AppDetailSegue" {
            let path = self.tableView.indexPath(for: sender as! AppListCell)
            let detailViewController = segue.destination as? AppDetailViewController
            detailViewController?.appId = self.viewModel.appList[path!.row].id
        }
    }
}

extension AppListViewController: ViewModelDelegate {
    
    func reloadView() {
        self.tableView.reloadData()
    }
}
