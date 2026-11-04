//
//  Post+Codable.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

extension Post {
    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }
}
