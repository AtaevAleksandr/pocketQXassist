//
//  SpinnerView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

struct SpinnerView: View {

    @State private var rotation: Double = 0

    var body: some View {
        Image("Spinner")
            .resizable()
            .scaledToFit()
            .frame(width: 71, height: 71)
            .rotationEffect(Angle(degrees: rotation))
            .animation(.linear(duration: 1.0).repeatForever(autoreverses: false), value: UUID())
            .onAppear {
                self.rotation = 360.0
            }
    }
}

#Preview {
    ZStack {
        Color.theme.background
            .ignoresSafeArea()
        SpinnerView()
    }
}
