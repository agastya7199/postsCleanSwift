//
//  PostDTO.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

struct PostDTO: Codable { // Contains snake case coming from api
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
