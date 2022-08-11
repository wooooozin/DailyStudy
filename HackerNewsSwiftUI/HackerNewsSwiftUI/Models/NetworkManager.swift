//
//  NetworkManager.swift
//  HackerNewsSwiftUI
//
//  Created by 효우 on 2022/08/11.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                guard let data = data else { return }
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
