//
//  Home.swift
//  SearchBarWithPagination
//
//  Created by Simec Sys Ltd. on 12/1/21.
//

import SwiftUI

struct Home: View {
    @StateObject var searchData = SearchUserViewModel()
    
    var body: some View {
        VStack {
            CustomSearchBar(searchData: searchData)
            Spacer()
        }
        .onChange(of: searchData.query) { (newData) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if newData == searchData.query {
                    if searchData.query != "" {
                        searchData.page = 1
                        searchData.find()
                    } else {
                        searchData.searchedUser.removeAll()
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
