//
//  PostListDetailsViewModel.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation

class PostListDetailsViewModel {
    private var arrPostSection : [String] = ["", "User Details", "Comments"]
    private var arrPostUser : UserModel?
    private var arrPostComments = [CommentsModel]()

    private lazy var postListDetailsServices: PostListDetailsServices = {
        return PostListDetailsServices()
    }()
    
    internal func loadPostUser(strUserId: String?, completion: @escaping (Bool,String) -> Void) {
        postListDetailsServices.getPostUserData(strUserId: strUserId, success: { (json) in
            //PARSE DATA.
            if let myjson = json.dictionary {
                print(myjson)
                
                let myJsonAddress = myjson["address"]
                let address = AddressModel(city: "\(myJsonAddress!["city"])", street: "\(myJsonAddress!["street"])", suite: "\(myJsonAddress!["suite"])", zipcode: "\(myJsonAddress!["zipcode"])")
                let myJsonCompany = myjson["company"]
                let company = CompanyModel(bs: "\(myJsonCompany!["bs"])", catchPhrase: "\(myJsonCompany!["catchPhrase"])", name: "\(myJsonCompany!["name"])")
                let email = myjson["email"]!.stringValue
                let id = myjson["id"]!.intValue
                let name = myjson["name"]!.stringValue
                let phone = myjson["phone"]!.stringValue
                let username = myjson["username"]!.stringValue
                let website = myjson["website"]!.stringValue

                let addressTxt = "\(myJsonAddress!["suite"]), \(myJsonAddress!["street"]), \(myJsonAddress!["city"]), \(myJsonAddress!["zipcode"])"
                let data = UserModel(address: address, company: company, email: email, id: id, name: name, phone: phone, username: username, website: website, addressTxt: addressTxt)
                self.arrPostUser = data
                completion(true, "success")
            }
        }, failure: { (error) in
            print(error)
            completion(false, error.localizedDescription)
        })
    }
    
    internal func loadPostComments(strPostId: String?, completion: @escaping (Bool,String) -> Void) {
        postListDetailsServices.getPostCommentsData(strPostId: strPostId, success: { (json) in
            //PARSE DATA.
            if let myjson = json.array {
                print(myjson)
                for value in myjson {
                    let body = value.dictionaryValue["body"]!.stringValue
                    let email = value.dictionaryValue["email"]!.stringValue
                    let id = value.dictionaryValue["id"]!.intValue
                    let name = value.dictionaryValue["name"]!.stringValue
                    let postId = value.dictionaryValue["postId"]!.intValue

                    let data = CommentsModel(body: body, email: email, id: id, name: name, postId: postId)
                    self.arrPostComments.append(data)
                }
                completion(true, "success")
            }
        }, failure: { (error) in
            print(error)
            completion(false, error.localizedDescription)
        })
    }
}

extension PostListDetailsViewModel {
    func getPostCommentsCount() -> Int {
        return self.arrPostComments.count
    }
    
    func getPostCommentsAt(index:Int) -> CommentsModel {
        return self.arrPostComments[index]
    }
}

extension PostListDetailsViewModel {
    func getPostDetailsSectionCount() -> Int {
        return self.arrPostSection.count
    }
    
    func getPostDetailsSectionAt(index:Int) -> String {
        return self.arrPostSection[index]
    }
}

extension PostListDetailsViewModel {
    func getPostUsersAt() -> UserModel? {
        return self.arrPostUser
    }
}
