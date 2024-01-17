//
//  IdeasView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import SwiftUI

struct IdeasView: View {

    @EnvironmentObject private var viewModel: PostViewModel

    var body: some View {
            ZStack {
                BackgroundView()

                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.allPosts) { post in
                        PostRowView(post: post)
                            .padding(.vertical, 5)
                    }
                    .padding()
                }
            }
    }
}

#Preview {
    IdeasView()
        .preferredColorScheme(.dark)
        .environmentObject(PostViewModel())
}
