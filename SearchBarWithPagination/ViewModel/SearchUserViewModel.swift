//
//  SearchUserViewModel.swift
//  SearchBarWithPagination
//
//  Created by Simec Sys Ltd. on 12/1/21.
//

import SwiftUI

class SearchUserViewModel: ObservableObject {
    @Published var searchedUser: [UserModel] = []
    
    // User Query
    @Published var query = ""
    @Published var page = 1
    
    func find() {
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
        let url = "https://api.github.com/search/users?q=\(searchQuery)&page=\(page)&per_page=10"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            guard let jsonData = data else { return }
            do {
                let users = try JSONDecoder().decode(Results.self, from: jsonData)
                DispatchQueue.main.async {
                    if self.page == 1 {
                        self.searchedUser.removeAll()
                    }
                    self.searchedUser = Array(Set(self.searchedUser).union(Set(users.items)))
                    //self.searchedUser.append(contentsOf: users.items)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
