//
//  DependencyContainer.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

class DependencyContainer {
    private let apiClient: APIClientProtocol
    private let mapper: PostMapper
    private let postRepository: PostRepository

    init() {
        let client = APIClient()
        let postMapper = PostMapper()

        self.apiClient = client
        self.mapper = postMapper
        self.postRepository = PostRepositoryImpl(apiClient: client, mapper: postMapper)
    }
    
    func makePostsViewModel() -> PostsViewModel {
        let useCase = FetchPostsUseCase(repository: postRepository)
        return PostsViewModel(fetchPostsUseCase: useCase)
    }
}
