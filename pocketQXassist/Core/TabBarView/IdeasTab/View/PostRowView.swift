//
//  PostRowView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 17.01.2024.
//

import SwiftUI

struct PostRowView: View {

    let post: PostModel

    var body: some View {
        VStack(alignment: .leading) {
            Image(post.postImage)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading, spacing: 12) {
                Text(post.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)

                Text(post.subTitle)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .foregroundStyle(Color.theme.customGray)

                Text("By \(post.author)")
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
            }
            .padding(.top, 8)
            .padding(.horizontal)

            HStack {
                Text(post.date)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.theme.customGray)

                Spacer()

                Image(post.commentImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)

                Text("\(post.commentsCount)")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)

                Image(post.rocketImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)

                Text("\(post.rocketsCount)")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
            }
            .padding(.top, 4)
            .padding(.horizontal)
        }
        .padding(.bottom)
        .background(Color.theme.backgroundComponents)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.theme.border)
        }
        .roundedCorner(16, corners: .allCorners)
        .onTapGesture {
            withAnimation {
                openLink()
            }
        }
    }

    func openLink() {
        let urlString = post.link
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

#Preview {
    ZStack {
        BackgroundView()
        PostRowView(post: PostModel(link: "https://www.tradingview.com/chart/GBPUSD/RlyHMVZe-Sell-GBPUSD-Channel-Breakout/",
                                    postImage: "Post1",
                                    title: "Sell GBPUSD Channel Breakout",
                                    subTitle: "Weaker inflation, higher unemployment and gloom from policymakers. The fall in inflation is not the only issue holding the BoE back from hikes.",
                                    author: "KABHI_FOREX_TRADING",
                                    date: "Jan 17, 2024",
                                    commentImage: "commentImage",
                                    commentsCount: 29,
                                    rocketImage: "rocketImage",
                                    rocketsCount: 96))
    }
    .preferredColorScheme(.dark)
}
