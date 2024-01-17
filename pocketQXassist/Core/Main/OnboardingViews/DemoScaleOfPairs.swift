//
//  DemoScaleOfPairs.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

struct DemoScaleOfPairs: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Get your unique experience \nnow")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .padding()


            Spacer()

            Image("ScaleOfPairs")
                .resizable()
                .scaledToFit()

            Spacer()
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        BackgroundView()
        DemoScaleOfPairs()
    }
}
