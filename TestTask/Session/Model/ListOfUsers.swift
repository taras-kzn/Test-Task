//
//  ListOfUsers.swift
//  TestTask
//
//  Created by admin on 21.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


class ListOfUsers: Decodable {
    let data: [[Users]]
}

class Users: Decodable {
    var id = ""
    var body = ""
    var da = "0.0"
    var dm = "0.0"

    enum CodingKeys: String, CodingKey {
        case id
        case body
        case da
        case dm
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.body = try values.decode(String.self, forKey: .body)
        self.da = try values.decode(String.self, forKey: .da)
        self.dm = try values.decode(String.self, forKey: .dm)
    }

}


