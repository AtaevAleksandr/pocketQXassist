//
//  HeatWaveModel.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 18.01.2024.
//

import Foundation
import SwiftUI

enum Status: Codable, CaseIterable {
    case greenArrow
    case redArrow
    case whiteArrow

    var displayText: String {
        switch self {
        case .greenArrow:
            return "arrow.right"
        case .redArrow:
            return "arrow.left"
        case .whiteArrow:
            return ""
        }
    }

    var backgroundColor: Color {
        switch self {
        case .redArrow:
            return Color.theme.customRed
        case .greenArrow:
            return Color.theme.customGreen
        case .whiteArrow:
            return Color.white
        }
    }
}

struct HeatWaveModel: Identifiable {
    var id = UUID()
    let iconImage: String
    let color: Color
    var value: CGFloat
    var arrow: String
    var arrowColor: Color

    static var heatWaves: [HeatWaveModel] = [
        HeatWaveModel(iconImage: "EUR:USD",
                      color: .blue,
                      value: 34.56,
                      arrow: Status.greenArrow.displayText,
                      arrowColor: Status.greenArrow.backgroundColor),
        HeatWaveModel(iconImage: "EUR:CAD",
                      color: .red,
                      value: 13.02,
                      arrow: Status.whiteArrow.displayText,
                      arrowColor: Status.whiteArrow.backgroundColor),
        HeatWaveModel(iconImage: "GBP:USD",
                      color: .orange,
                      value: 19.72,
                      arrow: Status.whiteArrow.displayText,
                      arrowColor: Status.whiteArrow.backgroundColor),
        HeatWaveModel(iconImage: "EUR:GBP",
                      color: .purple,
                      value: 28.02,
                      arrow: Status.whiteArrow.displayText,
                      arrowColor: Status.whiteArrow.backgroundColor),
        HeatWaveModel(iconImage: "CAD:CHF",
                      color: .mint,
                      value: 30.77,
                      arrow: Status.whiteArrow.displayText,
                      arrowColor: Status.whiteArrow.backgroundColor),
        HeatWaveModel(iconImage: "USD:JPY",
                      color: .yellow,
                      value: 14.76, arrow: Status.redArrow.displayText,
                      arrowColor: Status.redArrow.backgroundColor),
        HeatWaveModel(iconImage: "CAD:JPY",
                      color: .indigo,
                      value: 10.56, arrow: Status.greenArrow.displayText,
                      arrowColor: Status.greenArrow.backgroundColor),
        HeatWaveModel(iconImage: "GBP:JPY",
                      color: .green,
                      value: 42.29, arrow: Status.redArrow.displayText,
                      arrowColor: Status.redArrow.backgroundColor)
    ]
}
