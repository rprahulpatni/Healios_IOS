//
//  PostList+TableView.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation
import UIKit

extension PostListVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListViewModel.getPostCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostListTVCell.nameOfClass, for: indexPath) as! PostListTVCell
        cell.lblTitle.text = self.postListViewModel.getPostAt(index: indexPath.row).title?.capitalized ?? ""
        cell.lblSubTitle.text = self.postListViewModel.getPostAt(index: indexPath.row).body ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.postListViewModel.getPostCount() > 0 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: PostListDetailsVC.nameOfClass) as! PostListDetailsVC
            vc.postData = self.postListViewModel.getPostAt(index: indexPath.row)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
