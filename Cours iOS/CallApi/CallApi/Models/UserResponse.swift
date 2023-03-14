//
//  UserResponse.swift
//  CallApi
//
//  Created by Dufour Sviatoslav on 09/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

struct UserResponse: Decodable {
    var status: String
    var data: User
}
