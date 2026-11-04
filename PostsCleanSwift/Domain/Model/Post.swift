//
//  Movie.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

struct Post: Identifiable { // Contains camel case needed for the application
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
