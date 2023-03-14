//
//  User.swift
//  CallApi
//
//  Created by Dufour Sviatoslav on 09/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

struct User: Decodable {
    var idMember: Int
    var lastName: String
    var firstName: String
    var eMail: String
    var eMailValid: Int
    var pwd: String
    var phone: String
    var pictureUrl: String
    var authToken: String
    var dateSignIn: String
    var timeSignIn: String
    var dateLogin: String
    var timeLogin: String
}
