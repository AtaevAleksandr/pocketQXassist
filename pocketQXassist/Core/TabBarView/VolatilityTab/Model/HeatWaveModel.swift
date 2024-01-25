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

    static func randomStatus() -> Status {
        let allCases = self.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}

struct HeatWaveModel: Identifiable {
    var id = UUID()
    var iconImage: String
    let color: Color
    var value: CGFloat
    var arrowStatus: Status

    static var heatWaves: [HeatWaveModel] = [
        HeatWaveModel(iconImage: "EUR:USD",
                      color: .blue,
                      value: 34.56,
                      arrowStatus: .randomStatus()),
        HeatWaveModel(iconImage: "EUR:CAD",
                      color: .red,
                      value: 13.02,
                      arrowStatus: .randomStatus()),
        HeatWaveModel(iconImage: "GBP:USD",
                      color: .orange,
                      value: 19.72,
                      arrowStatus: .randomStatus()),
        HeatWaveModel(iconImage: "EUR:GBP",
                      color: .purple,
                      value: 28.02,
                      arrowStatus: .randomStatus()),
        HeatWaveModel(iconImage: "CAD:CHF",
                      color: .mint,
                      value: 30.77,
                      arrowStatus: .randomStatus()),
        HeatWaveModel(iconImage: "USD:JPY",
                      color: .yellow,
                      value: 14.76, 
                      arrowStatus: .randomStatus()),
        HeatWaveModel(iconImage: "CAD:JPY",
                      color: .indigo,
                      value: 10.56, 
                      arrowStatus: .randomStatus()),
        HeatWaveModel(iconImage: "GBP:JPY",
                      color: .green,
                      value: 42.29, 
                      arrowStatus: .randomStatus())
    ]
}
