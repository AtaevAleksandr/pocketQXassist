//
//  PostViewModel.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 17.01.2024.
//

import Foundation

final class PostViewModel: ObservableObject {

    @Published var allPosts: [PostModel] = PostModel.posts
}
