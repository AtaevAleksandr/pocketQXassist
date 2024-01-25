//
//  HeatWaveViewModel.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 18.01.2024.


import Foundation

final class HeatWaveViewModel: ObservableObject {

    @Published var allHeatWaves: [HeatWaveModel] = HeatWaveModel.heatWaves

    func updateHeatWaves() {
        var zeroCount = 0

        for index in allHeatWaves.indices {
            var randomValueChange: CGFloat

            if zeroCount < 2 {
                // Генерация случайного значения с возможностью быть равным 0
                if allHeatWaves[index].value <= 10 {
                    randomValueChange = Bool.random() ? CGFloat.random(in: 0...5) : 0
                } else if allHeatWaves[index].value >= 95 {
                    randomValueChange = Bool.random() ? CGFloat.random(in: -5...0) : 0
                } else {
                    randomValueChange = Bool.random() ? CGFloat.random(in: -5...5) : 0
                }

                if randomValueChange == 0 {
                    zeroCount += 1
                }
            } else {
                // Генерация случайного значения без 0, так как у нас уже есть два
                if allHeatWaves[index].value <= 10 {
                    randomValueChange = CGFloat.random(in: 0...5)
                } else if allHeatWaves[index].value >= 95 {
                    randomValueChange = CGFloat.random(in: -5...0)
                } else {
                    randomValueChange = CGFloat.random(in: -5...5)
                }
            }

            allHeatWaves[index].value += randomValueChange
            allHeatWaves[index].value = max(10, min(allHeatWaves[index].value, 95))

            if randomValueChange > 0 {
                allHeatWaves[index].arrowStatus = .greenArrow
            } else if randomValueChange < 0 {
                allHeatWaves[index].arrowStatus = .redArrow
            } else {
                allHeatWaves[index].arrowStatus = .whiteArrow
            }
        }

        objectWillChange.send()
    }
}
