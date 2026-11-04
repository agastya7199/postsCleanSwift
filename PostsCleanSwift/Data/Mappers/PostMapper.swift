//
//  PostMapper.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

struct PostMapper {
    func toDomain(_ dto: PostDTO) -> Post { // Mapping dto's snake case to camel case
        Post(
            albumId: dto.albumId,
            id: dto.id,
            title: dto.title,
            url: dto.url,
            thumbnailUrl: dto.thumbnailUrl
        )
    }
    
    func toDomain(_ dtos: [PostDTO]) -> [Post] {
        dtos.map({ toDomain($0) }) 
    }
}
