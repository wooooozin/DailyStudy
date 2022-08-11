//
//  ContentView.swift
//  HackerNewsSwiftUI
//
//  Created by 효우 on 2022/08/10.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
