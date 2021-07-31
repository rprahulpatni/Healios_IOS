//
//  APIHeaders.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation
import Alamofire

class APIHeaders: NSObject {
    func getDefaultHeaders() -> HTTPHeaders {
        let headers : HTTPHeaders = [
            "Content-Type":"application/json", "Accept":"application/json", "x-request-os":"ios",
        ]
        return headers;
    }
}
