//
//  HomeView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject private var viewModel: PairViewModel

    var body: some View {
        ZStack {
            BackgroundView()

            ScrollView(showsIndicators: false) {
                ForEach(viewModel.allPairs) { pair in
                    PairRowView(pair: pair)
                        .padding(.vertical, 5)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
        .environmentObject(PairViewModel())
}
