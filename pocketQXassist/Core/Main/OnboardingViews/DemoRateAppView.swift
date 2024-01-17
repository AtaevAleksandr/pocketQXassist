//
//  DemoRateAppView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

struct DemoRateAppView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Help us to improve the app")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)

                Spacer()
            }

            HStack {
                Text("Other users about us")
                    .font(.subheadline)
                    .foregroundStyle(Color.theme.customGray)
                    .padding(.top, 5)

                Spacer()
            }

            Spacer()

            Image("DemoUserRate")
                .resizable()
                .scaledToFit()

            Spacer()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ZStack {
        BackgroundView()
        DemoRateAppView()
    }
}
