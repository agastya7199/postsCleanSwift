//
//  APIClient.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

import SwiftUI

protocol APIClientProtocol {
    func fetchPosts<T: Decodable>(postUrlString: String) async throws -> T
}

class APIClient: APIClientProtocol {
    func fetchPosts<T: Decodable>(postUrlString: String) async throws -> T {
        guard let urlEndPoint = URL(string: postUrlString) else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: urlEndPoint)
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            return try JSONDecoder().decode(T.self, from: data)
        }
    }
}
