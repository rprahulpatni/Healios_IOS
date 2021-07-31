//
//  PostListViewModel.swift
//  Healios_IOS_Test
//
//  Created by Neosoft on 31/07/21.
//

import Foundation
import Alamofire_SwiftyJSON
import SwiftyJSON

class PostListViewModel {
    private var arrPostList = [PostModel]()
    
    private lazy var postListServices: PostListServices = {
        return PostListServices()
    }()
    
    internal func loadPost(completion: @escaping (Bool,String) -> Void) {
        let myjson = self.retrieveFromJsonFile()
        if myjson.count > 0 {
            self.mapData(myjson: myjson)
            completion(true, "success")
        } else {
            postListServices.getPostData(success: { (json) in
                //PARSE DATA.
                self.saveToJsonFile(json: json)
                let myjson = self.retrieveFromJsonFile()
                self.mapData(myjson: myjson)
                completion(true, "success")
            }, failure: { (error) in
                print(error)
                completion(false, error.localizedDescription)
            })
        }
    }
}

extension PostListViewModel {
    func getPostCount() -> Int {
        return self.arrPostList.count
    }
    
    func getPostAt(index:Int) -> PostModel {
        return self.arrPostList[index]
    }
}

//Local Data
extension PostListViewModel {
    func mapData(myjson : JSON) {
        for value in myjson.arrayValue {
            let body = value.dictionaryValue["body"]!.stringValue
            let id = value.dictionaryValue["id"]!.intValue
            let title = value.dictionaryValue["title"]!.stringValue
            let userId = value.dictionaryValue["userId"]!.intValue
            
            let data = PostModel(body: body, id: id, title: title, userId: userId)
            self.arrPostList.append(data)
        }
    }
    
    func saveToJsonFile(json: JSON) {
        // Get the url of Persons.json in document directory
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("Posts.json")
        // Transform array into data and save it into file
        if let data = try? json.rawData() {
            try? data.write(to: fileUrl)
        }
    }
    
    func retrieveFromJsonFile() -> JSON {
        // Get the url of Persons.json in document directory
        guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let fileUrl = documentsDirectoryUrl.appendingPathComponent("Posts.json")
        // Read data from .json file and transform data into an array
        do {
            let data = try Data(contentsOf: fileUrl, options: [])
            if let json = try? JSON(data: data as Data) {
                print(json)
                return json
            }
        } catch {
            print(error)
        }
        return nil
    }
}
