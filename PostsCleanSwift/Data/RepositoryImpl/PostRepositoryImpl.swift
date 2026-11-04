//
//  PostRepositoryImpl.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

class PostRepositoryImpl: PostRepository {
    private let apiClient: APIClientProtocol
    private let mapper: PostMapper
    
    init(apiClient: APIClientProtocol, mapper: PostMapper) {
        self.apiClient = apiClient
        self.mapper = mapper
    }
    
    func fetchPosts() async throws -> [Post] {
        let dto: [PostDTO] = try await apiClient.fetchPosts(postUrlString: PostEndPoint.postEP.rawValue)
        return mapper.toDomain(dto)
    }
}
