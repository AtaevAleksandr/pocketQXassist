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

    var body: some Scene {
        WindowGroup {
            LoadingView()
                .environmentObject(pairVM)
                .environmentObject(postVM)
                .preferredColorScheme(.dark)
        }
    }
}
