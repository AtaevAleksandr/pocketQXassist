//
//  DemoPairsView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

struct DemoPairsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Thermal charts of pairs")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)

                Spacer()
            }

            HStack {
                Text("Choose a pair and build your strategies")
                    .font(.subheadline)
                    .foregroundStyle(Color.theme.customGray)
                    .padding(.top, 5)

                Spacer()
            }

            Spacer()

            Image("Cell1")
                .resizable()
                .scaledToFit()

            Image("Cell2")
                .resizable()
                .scaledToFit()

            Image("Cell3")
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
        DemoPairsView()
    }
}
