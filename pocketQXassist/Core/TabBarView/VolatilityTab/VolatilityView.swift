//
//  VolatilityView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import SwiftUI

struct VolatilityView: View {

    @EnvironmentObject private var viewModel: HeatWaveViewModel

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var timeRemaining: String = ""

    @State private var nextUpdateTime: Date = {
        let calendar = Calendar.current
        let endTime = calendar.date(byAdding: .second, value: 300, to: Date()) ?? Date()
        return endTime
    }()

    var body: some View {
        ZStack {
            BackgroundView()

            VStack(spacing: 1) {
                HStack(spacing: 5) {
                    Text("The next update is in")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.theme.customGray)

                    Text("\(timeRemaining)")
                        .font(.system(size: 15, weight: .semibold))
                        .animation(.none)

                    Spacer()
                }

                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.allHeatWaves) { heatWave in
                        HeatWaveRowView(heatWave: heatWave)
                            .padding(.vertical, 4)
                    }
                }
                .padding(.top, 16)
            }
            .padding()
        }
        .onReceive(timer) { _ in
            withAnimation(.linear(duration: 0.5)) {
                updateTimeRemaining()
            }
        }

        .onAppear {
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
            nextUpdateTime = calendar.date(byAdding: .second, value: 300, to: Date()) ?? Date()
            viewModel.updateHeatWaves()
        }

        let remaining = calendar.dateComponents([.minute, .second], from: currentTime, to: nextUpdateTime)
        if let minute = remaining.minute, let second = remaining.second {
            timeRemaining = String(format: "%02d:%02d", minute, second)
        }
    }
}

























#Preview {
    VolatilityView()
        .preferredColorScheme(.dark)
        .environmentObject(HeatWaveViewModel())
}
