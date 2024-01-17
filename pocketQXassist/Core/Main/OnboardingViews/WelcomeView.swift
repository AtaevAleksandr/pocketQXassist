//
//  WelcomeView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Welcome!")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)

                Spacer()
            }

            Text("Our application will introduce you to the market, suitable for both beginners and experienced traders.")
                .font(.subheadline)
                .foregroundStyle(Color.theme.customGray)
                .padding(.top, 5)

            Text("Let's introduce you to the functionality, you will like it!")
                .font(.subheadline)
                .foregroundStyle(Color.theme.customGray)
                .padding(.top, 5)

            ZStack {
                Image("Ellipse")
                    .resizable()
                    .scaledToFit()
                Image("iPhoneWelcome")
                    .resizable()
                    .scaledToFit()
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ZStack {
        BackgroundView()
        WelcomeView()
    }
}
