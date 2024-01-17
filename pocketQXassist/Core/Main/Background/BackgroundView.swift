//
//  BackgroundView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color.theme.background
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
