//
//  PostListDetailsModel.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation

struct UserModel {
    
    var address : AddressModel?
    var company : CompanyModel?
    var email : String?
    var id : Int?
    var name : String?
    var phone : String?
    var username : String?
    var website : String?
    var addressTxt : String?
    
    init(address: AddressModel?, company: CompanyModel?, email: String?, id: Int?, name: String?, phone: String?, username: String?, website: String?, addressTxt: String?){
        self.address = address
        self.company = company
        self.email = email
        self.id = id
        self.name = name
        self.phone = phone
        self.username = username
        self.website = website
        self.addressTxt = addressTxt
    }
}

struct AddressModel {
    
    var city : String?
    var street : String?
    var suite : String?
    var zipcode : String?
    
    init(city: String?, street: String?, suite: String?, zipcode: String?){
        self.city = city
        self.street = street
        self.suite = suite
        self.zipcode = zipcode
    }
}

struct CompanyModel {
    
    var bs : String?
    var catchPhrase : String?
    var name : String?
    
    init(bs: String?, catchPhrase: String?, name: String?){
        self.bs = bs
        self.catchPhrase = catchPhrase
        self.name = name
    }
}

struct CommentsModel {
    
    var body : String?
    var email : String?
    var id : Int?
    var name : String?
    var postId : Int?
    
    init(body: String?, email: String?, id: Int?, name: String?, postId: Int?){
        self.body = body
        self.email = email
        self.id = id
        self.name = name
        self.postId = postId
    }
}
