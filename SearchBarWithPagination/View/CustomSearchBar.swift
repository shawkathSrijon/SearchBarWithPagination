//
//  CustomSearchBar.swift
//  SearchBarWithPagination
//
//  Created by Simec Sys Ltd. on 12/1/21.
//

import SwiftUI

struct CustomSearchBar: View {
    @ObservedObject var searchData: SearchUserViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                TextField("Search", text: $searchData.query)
                    .autocapitalization(.none)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            if !searchData.searchedUser.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(searchData.searchedUser, id: \.self) { user in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(user.login)
                                Divider()
                            }
                            .padding(.horizontal)
                            .onAppear {
                                if user.node_id == searchData.searchedUser.last?.node_id && searchData.page <= 3 {
                                    searchData.page += 1
                                    searchData.find()
                                }
                            }
                        }
                    }
                    .padding(.top)
                }
                .frame(height: 240)
            }
        }
        .background(Color.gray.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
    }
}
