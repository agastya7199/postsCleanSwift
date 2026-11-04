//
//  FetchPostsUseCase.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

import Foundation

// MARK: - Protocol
protocol FetchPostsUseCaseProtocol {
    func execute() async throws -> [Post]
}

// MARK: - Implementation
struct FetchPostsUseCase: FetchPostsUseCaseProtocol {
    private let repository: PostRepository

    init(repository: PostRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Post] {
        return try await repository.fetchPosts()
    }
}
