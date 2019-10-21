//
//  NewSession.swift
//  TestTask
//
//  Created by admin on 21.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit


class NewSession: Decodable {
    let data: Session
}

class Session: Decodable {
    var session = ""
    
    enum CodingKeys: String, CodingKey {
        case session
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.session = try values.decode(String.self, forKey: .session)
    }
    
}


  


