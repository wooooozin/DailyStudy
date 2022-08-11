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
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack {
                        VStack {
                            Image(systemName: "hand.thumbsup")
                                .foregroundColor(.gray)
                            Text(String(post.points))
                                .padding()
                        }
                        Text(post.title)
                    }
                    .frame(height: 100)
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
