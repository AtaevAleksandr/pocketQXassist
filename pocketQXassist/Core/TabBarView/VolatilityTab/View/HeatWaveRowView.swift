//
//  HeatWaveRowView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 18.01.2024.
//

import SwiftUI

struct HeatWaveRowView: View {

    let heatWave: HeatWaveModel

    var body: some View {
        HeatWaveScaleView(heatWave:
                            HeatWaveModel(iconImage: heatWave.iconImage,
                                          color: heatWave.color,
                                          value: heatWave.value, arrowStatus: heatWave.arrowStatus))
    }
}
