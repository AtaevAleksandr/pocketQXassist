//
//  pocketQXassistApp.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

@main
struct pocketQXassistApp: App {

    @StateObject private var pairVM = PairViewModel()
    @StateObject private var postVM = PostViewModel()
    @StateObject private var heatWaveVM = HeatWaveViewModel()

    var body: some Scene {
        WindowGroup {
            LoadingView()
                .environmentObject(pairVM)
                .environmentObject(postVM)
                .environmentObject(heatWaveVM)
                .preferredColorScheme(.dark)
        }
    }
}
