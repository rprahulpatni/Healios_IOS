//
//  PostListModel.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation

struct PostModel {
    var body : String?
    var id : Int?
    var title : String?
    var userId : Int?
    
    init(body: String?, id: Int?, title: String?, userId: Int?){
        self.body = body
        self.id = id
        self.title = title
        self.userId = userId
    }
}
