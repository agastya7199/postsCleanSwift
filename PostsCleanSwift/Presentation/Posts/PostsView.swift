//
//  PostsView.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

import SwiftUI

struct PostsView: View {
    @State var viewModel: PostsViewModel
    var body: some View {
        NavigationStack {
            List(viewModel.postsList) { post in
                VStack(alignment: .leading, spacing: 6) {
                    Text(post.title)
                        .font(.headline)
                    Text("Post ID: \(post.id); Album: \(post.albumId)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Posts")
            .task {
                if viewModel.postsList.isEmpty {
                    await viewModel.getPosts()
                }
            }
        }
    }
}

#Preview {
    let container = DependencyContainer()
    PostsView(viewModel: container.makePostsViewModel())
}
