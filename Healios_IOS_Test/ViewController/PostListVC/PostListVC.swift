//
//  PostListVC.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import UIKit

class PostListVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblNoDataFound: UILabel!

    lazy var postListViewModel: PostListViewModel = {
        return PostListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Post"
        self.tblView.tableFooterView = UIView()
        self.callAPIForPostData()
    }
}

extension PostListVC {
    func callAPIForPostData() {
        DispatchQueue.main.async {
            CustomLoaderView.showLoader()
        }
        self.postListViewModel.loadPost(completion: { (status, msg)  in
            DispatchQueue.main.async {
                CustomLoaderView.dismiss()
                if status == true {
                    self.tblView.reloadData()
                    self.lblNoDataFound.isHidden = true
                } else {
                    self.lblNoDataFound.isHidden = false
                }
            }
        })
    }
}

