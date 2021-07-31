//
//  PostListDetailsServices.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON

protocol IPostListDetailsServices {
    func getPostUserData(strUserId: String?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
    func getPostCommentsData(strPostId: String?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
}

class PostListDetailsServices: IPostListDetailsServices {
    
    internal func getPostUserData(strUserId: String?,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        APIManager.sharedInstance.apiRequest(url: "http://jsonplaceholder.typicode.com/users/\(strUserId ?? "")", method: .get, headerValue: APIHeaders().getDefaultHeaders(), params: nil, success: { (json) in
            success(json)
        }, failure: { (error) in
            print(error)
            failure(error)
        })
    }
    
    internal func getPostCommentsData(strPostId: String?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        APIManager.sharedInstance.apiRequest(url: "http://jsonplaceholder.typicode.com/posts/\(strPostId ?? "")/comments", method: .get, headerValue: APIHeaders().getDefaultHeaders(), params: nil, success: { (json) in
            success(json)
        }, failure: { (error) in
            print(error)
            failure(error)
        })
    }
}
