//
//  PostRepository.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

protocol PostRepository {
    func fetchPosts() async throws -> [Post]
}
