//
//  SupportButton.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import SwiftUI

struct SupportButton: View {

    @State var title: String
    @State var iconImage: String

    var body: some View {
        Button {
            openLink()
        } label: {
            HStack() {
                Image(iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)

                Text(LocalizedStringKey(title))
                    .font(.system(size: 16, weight: .medium))

                Spacer()

                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 53)
        .foregroundStyle(.white)
        .background(Color.theme.backgroundComponents)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.theme.border)
        }
    }

    func openLink() {
        let urlString = "https://docs.google.com/forms"
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
        SupportButton(title: "Support", iconImage: "Support")
    }
}
