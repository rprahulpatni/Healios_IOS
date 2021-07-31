//
//  PostListServices.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON

protocol IPostListServices {
    func getPostData(success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
}

class PostListServices: IPostListServices {
    
    internal func getPostData(success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        APIManager.sharedInstance.apiRequest(url: "http://jsonplaceholder.typicode.com/posts", method: .get, headerValue: APIHeaders().getDefaultHeaders(), params: nil, success: { (json) in
            success(json)
        }, failure: { (error) in
            print(error)
            failure(error)
        })
    }
}
