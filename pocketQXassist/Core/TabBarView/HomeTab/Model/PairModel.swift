//
//  PairModel.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import Foundation
import SwiftUI

struct PairModel: Identifiable {
    var id = UUID()
    let iconImage: String
    let name: String
    let value: CGFloat

    static var pairs: [PairModel] = [
        PairModel(iconImage: "AUD:USD",
                  name: "AUD/USD",
                  value: 3.92),
        PairModel(iconImage: "EUR:USD",
                  name: "EUR/USD",
                  value: 5.15),
        PairModel(iconImage: "USD:JPY",
                  name: "USD/JPY",
                  value: 6.43),
        PairModel(iconImage: "GBP:USD",
                  name: "GBP/USD",
                  value: 8.28),
        PairModel(iconImage: "USD:CHF",
                  name: "USD/CHF",
                  value: 7.36),
        PairModel(iconImage: "USD:CAD",
                  name: "USD/CAD",
                  value: 4.79),
        PairModel(iconImage: "NZD:USD",
                  name: "NZD/USD",
                  value: 2.86)
    ]
}
