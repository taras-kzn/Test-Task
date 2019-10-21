//
//  TestService.swift
//  TestTask
//
//  Created by admin on 19.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import Alamofire


class TestService {
    
    let baseUrl = "https://bnet.i-partner.ru"
    let apiKey = "6DiM40j-WX-O3gcAGq"
    
    func loadNewSession(completion: @escaping (Session) -> Void) {
        let path = "/testAPI/"
        let parameters: Parameters = [
            "a": "new_session",
        ]
        
        let headers = [
            "token" : apiKey
        ]
        
        let url = baseUrl+path
        
        Alamofire.request(url, method: .post, parameters: parameters,headers: headers ).responseData {
            response in
            guard let data = response.value else {return}
            
            let session = try! JSONDecoder().decode(NewSession.self, from:data).data
           // print(session)
            completion(session)
        
            
        }
    }
    
    func loadAddEntry(session: String) {
        let path = "/testAPI/"
        let session = session
        let parameters: Parameters = [
            "a" : "add_entry",
            "session" : session,
            "body" : "всем приветfsefadf"
        ]
        let headers = [
            "token" : apiKey
        ]
        
        let url = baseUrl+path

        
        Alamofire.request(url, method: .get, parameters: parameters,headers: headers ).responseJSON { response in
            print(response)
        }
        
    }
    
    func loadGetEntries(sessionID: String) {

        let path = "/testAPI/"
        let session = sessionID
        let parameters: Parameters = [
            "a" : "get_entries",
            "session" : session

        ]
        let headers = [
            "token" : apiKey
        ]

        let url = baseUrl+path


        Alamofire.request(url, method: .post, parameters: parameters,headers: headers ).responseJSON { response in
            
            print(response)


        }

    }
    
}
