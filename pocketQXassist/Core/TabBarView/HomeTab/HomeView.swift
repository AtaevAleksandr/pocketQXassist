//
//  HomeView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject private var viewModel: PairViewModel

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var nextUpdateTime: Date = {
        let calendar = Calendar.current
        let endTime = calendar.date(byAdding: .second, value: 5, to: Date()) ?? Date()
        return endTime
    }()

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
        .onReceive(timer) { _ in
            withAnimation(.linear(duration: 0.5)) {
                updateTimeRemaining()
            }
        }
    }

    //MARK: FUNCTIONS
    func updateTimeRemaining() {
        let currentTime = Date()
        let calendar = Calendar.current

        if currentTime >= nextUpdateTime {
            nextUpdateTime = calendar.date(byAdding: .second, value: 5, to: Date()) ?? Date()
            viewModel.updatePairs()
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
        .environmentObject(PairViewModel())
}
