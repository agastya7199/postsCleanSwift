//
//  PostsViewModel.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

import SwiftUI

protocol PostsViewModelProtocol {
    var postsList: [Post] { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    func getPosts() async
}

@Observable
class PostsViewModel {
    private(set) var postsList: [Post] = []
    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String? = nil

    // MARK: - Dependencies
    private let fetchPostsUseCase: FetchPostsUseCaseProtocol

    // MARK: - Initializer with Dependency Injection
    init(fetchPostsUseCase: FetchPostsUseCaseProtocol) {
        self.fetchPostsUseCase = fetchPostsUseCase
    }
    
    @MainActor
    func getPosts() async {
        isLoading = true
        errorMessage = nil

        do {
            postsList = try await fetchPostsUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
