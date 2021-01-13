//
//  ContentView.swift
//  SearchBarWithPagination
//
//  Created by Simec Sys Ltd. on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .preferredColorScheme(.dark)
                .navigationBarTitle("GitHub Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
