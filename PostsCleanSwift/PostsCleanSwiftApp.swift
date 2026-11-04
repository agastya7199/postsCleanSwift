//
//  PostsCleanSwiftApp.swift
//  PostsCleanSwift
//
//  Created by Mouli Agastya on 11/4/26.
//

import SwiftUI

@main
struct PostsCleanSwiftApp: App {
    var body: some Scene {
        WindowGroup {
            let container = DependencyContainer()
            PostsView(viewModel: container.makePostsViewModel())
        }
    }
}
