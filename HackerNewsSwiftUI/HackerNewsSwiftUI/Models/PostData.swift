//
//  PostData.swift
//  HackerNewsSwiftUI
//
//  Created by 효우 on 2022/08/11.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
