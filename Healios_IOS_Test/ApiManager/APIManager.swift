//
//  APIManager.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class APIManager {
    static let sharedInstance = APIManager()
    
    internal func apiRequest(url:String, method: HTTPMethod, headerValue:HTTPHeaders, params:Parameters?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        if ((NetworkReachabilityManager()?.isReachable) != nil) {
            Alamofire.request(URL.init(string: url)!, method: method, encoding: URLEncoding.default, headers: headerValue).responseSwiftyJSON { (dataResponse) in
                print(dataResponse.result)
                if dataResponse.result.isSuccess {
                    let resJson = JSON(dataResponse.result.value!)
                    success(resJson)
                }
                if dataResponse.result.isFailure {
                    let error : Error = dataResponse.result.error!
                    failure(error)
                }
            }
        } else {
            let error : Error = MessagesText.noInternetConnection as! Error
            failure(error)
        }
    }
}
