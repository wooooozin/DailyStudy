//
//  ContentView.swift
//  HackerNewsSwiftUI
//
//  Created by 효우 on 2022/08/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("asd")
            }
            .navigationTitle("Hacker News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

