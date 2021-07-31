//
//  PostListDetailsVC.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import UIKit

class PostListDetailsVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    lazy var postListDetailsViewModel: PostListDetailsViewModel = {
        return PostListDetailsViewModel()
    }()
    var postData : PostModel?
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Post Details"
        self.tblView.tableFooterView = UIView()
        
        self.callApiforPostDetails()
    }
}

extension PostListDetailsVC {
    func callApiforPostDetails() {
        DispatchQueue.main.async {
            CustomLoaderView.showLoader()
        }
        self.dispatchGroup.enter()
        self.postListDetailsViewModel.loadPostUser(strUserId: "\(postData?.userId ?? 0)", completion: { (status, msg)  in
            self.dispatchGroup.leave()
            DispatchQueue.main.async {
                if status == true {
                    self.tblView.reloadData()
                }
            }
        })
        
        self.dispatchGroup.enter()
        self.postListDetailsViewModel.loadPostComments(strPostId: "\(postData?.id ?? 0)", completion: { (status, msg)  in
            self.dispatchGroup.leave()
            if status == true {
                self.tblView.reloadData()
            }
        })
        
        self.dispatchGroup.notify(queue: .main) {
            DispatchQueue.main.async {
                CustomLoaderView.dismiss()
            }
        }
    }
}
