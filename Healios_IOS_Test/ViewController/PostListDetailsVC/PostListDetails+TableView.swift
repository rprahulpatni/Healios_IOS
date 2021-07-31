//
//  PostListDetails+TableView.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation
import UIKit

extension PostListDetailsVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.postListDetailsViewModel.getPostDetailsSectionCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.postData != nil ? 1 : 0
        } else if section == 1 {
            return self.postListDetailsViewModel.getPostUsersAt() != nil ? 1 : 0
        } else {
            return self.postListDetailsViewModel.getPostCommentsCount()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.postListDetailsViewModel.getPostDetailsSectionAt(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostListTVCell.nameOfClass, for: indexPath) as! PostListTVCell
            cell.lblTitle.text = self.postData?.title?.capitalized ?? ""
            cell.lblSubTitle.text = self.postData?.body?.capitalized ?? ""

            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostUserTVCell.nameOfClass, for: indexPath) as! PostUserTVCell
            cell.lblName.text = self.postListDetailsViewModel.getPostUsersAt()!.name?.capitalized
            cell.lblPhone.text = self.postListDetailsViewModel.getPostUsersAt()!.phone
            cell.lblEmail.text = self.postListDetailsViewModel.getPostUsersAt()!.email?.lowercased()
            cell.lblAddress.text = self.postListDetailsViewModel.getPostUsersAt()!.addressTxt
            cell.lblWebsite.text = self.postListDetailsViewModel.getPostUsersAt()!.website

            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCommentsTVCell.nameOfClass, for: indexPath) as! PostCommentsTVCell
            cell.lblName.text = self.postListDetailsViewModel.getPostCommentsAt(index: indexPath.row).name?.capitalized
            cell.lblEmail.text = self.postListDetailsViewModel.getPostCommentsAt(index: indexPath.row).email?.lowercased()
            cell.lblBody.text = self.postListDetailsViewModel.getPostCommentsAt(index: indexPath.row).body?.capitalized
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
