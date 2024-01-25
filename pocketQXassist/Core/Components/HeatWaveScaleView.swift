//
//  HeatWaveScaleView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 18.01.2024.
//

import SwiftUI

struct HeatWaveScaleView: View {

    let heatWave: HeatWaveModel
    @State private var barLimit: Float = 100

    var body: some View {
        HStack {
            Image(heatWave.iconImage)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .animation(.none, value: UUID())

            HeatScaleView(barTotal: CGFloat(barLimit), barValue: heatWave.value, barColor: heatWave.color)

            HStack {
                Text("\(heatWave.value, format: .number.precision(.fractionLength(2)))%")
                    .font(.system(size: 13, weight: .bold))
                    .animation(.none, value: UUID())

                Image(systemName: heatWave.arrowStatus.displayText)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .font(.system(size: 12, weight: .bold))
                    .animation(.none, value: UUID())
            }
            .foregroundStyle(heatWave.arrowStatus.backgroundColor)
        }
    }
}

struct HeatScaleView: View {

    let barTotal: CGFloat
    let barValue: CGFloat
    let barColor: Color

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(Color.theme.backgroundBar)

                Rectangle()
                    .foregroundColor(barColor)
                    .frame(width: geometry.size.width * CGFloat(barValue) / CGFloat(barTotal))
                    .roundedCorner(.infinity, corners: [.topLeft, .bottomLeft])
            }
        }
        .frame(height: 25)
    }
}
