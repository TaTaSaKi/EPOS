//
//  User.swift
//  EPOS
//
//  Created by Ratanak on 8/6/18.
//  Copyright © 2018 Ratanak. All rights reserved.
//

import RealmSwift

class User: Object {

    @objc dynamic var userID = UUID().uuidString
    @objc dynamic var username = ""
    @objc dynamic var password = ""
    @objc dynamic var firstname = ""
    @objc dynamic var lastname = ""
    @objc dynamic var email = ""
    @objc dynamic var phone = ""
    override static func primaryKey() -> String? {
        return "userID"
    }
}
let addUser = User( value: [ "username": "client", "password": "123", "firstname": "Client", "lastname": "Client", "email": "1@g.com", "phone": "012345678" ])

