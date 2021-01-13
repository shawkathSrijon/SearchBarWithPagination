//
//  UserModel.swift
//  SearchBarWithPagination
//
//  Created by Simec Sys Ltd. on 12/1/21.
//

import SwiftUI

struct UserModel: Decodable, Hashable {
    var node_id: String
    var login: String
    var avatar_url: String
}
    
struct Results: Decodable {
    var items: [UserModel]
}
