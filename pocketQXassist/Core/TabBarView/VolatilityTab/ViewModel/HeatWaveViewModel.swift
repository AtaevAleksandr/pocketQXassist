//
//  HeatWaveViewModel.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 18.01.2024.


import Foundation

final class HeatWaveViewModel: ObservableObject {

    @Published var allHeatWaves: [HeatWaveModel] = HeatWaveModel.heatWaves

    private let lastRandomValueKey = "lastRandomValue"

    private var lastRandomValue: CGFloat {
        didSet {
            UserDefaults.standard.set(lastRandomValue, forKey: lastRandomValueKey)
        }
    }

    init() {
        lastRandomValue = UserDefaults.standard.value(forKey: lastRandomValueKey) as? CGFloat ?? 0.0
        updateHeatWaves()
    }

    func updateHeatWaves() {
        for index in allHeatWaves.indices {
            let randomValueChange = CGFloat.random(in: -15...15)
            allHeatWaves[index].value += randomValueChange
            allHeatWaves[index].value = max(10, min(allHeatWaves[index].value, 95))

            lastRandomValue = randomValueChange

            // Обновление цвета стрелки в зависимости от прироста или убывания значения
            if randomValueChange > 0 {
                allHeatWaves[index].arrow = Status.greenArrow.displayText
                allHeatWaves[index].arrowColor = Status.greenArrow.backgroundColor
            } else if randomValueChange < 0 {
                allHeatWaves[index].arrow = Status.redArrow.displayText
                allHeatWaves[index].arrowColor = Status.redArrow.backgroundColor
            } else {
                allHeatWaves[index].arrow = Status.whiteArrow.displayText
                allHeatWaves[index].arrowColor = Status.whiteArrow.backgroundColor
            }
        }
        objectWillChange.send()
    }
}
