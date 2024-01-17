//
//  LoadingView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

struct LoadingView: View {

    @AppStorage("isAlredyOnboarding") var isAlredyOnboarding: Bool = false
//    @State private var isFirstLaunch: Bool = false
//    @AppStorage("isNotificationPermissionGranted") var isNotificationPermissionGranted: Bool = false
//    @State private var isShowViewIn2Min: Bool = false
//    @State private var isShowViewEvery3Time: Bool = false
//    @State private var isAppearViewEvery3Time: Bool = false
//
//    @AppStorage("launchCount") private var launchCount: Int = 0
    @State private var isInitialLoadingCompleted: Bool = false
    @State private var isLoading: Bool = false
    @State private var rotation: Double = 0

    var body: some View {
        ZStack {
            if isAlredyOnboarding && isInitialLoadingCompleted {
                TabBarView()
            } else {
                OnboardingView()
            }

            if isLoading {
                ZStack {
                    BackgroundView()
                    SpinnerView()
                }
            }
        }
        .onAppear {
            if !isInitialLoadingCompleted {
                fakeStartLoading()
            }
        }
    }

    private func fakeStartLoading() {
        isLoading = true
//        checkNotificationPermission()

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            isLoading = false
            isInitialLoadingCompleted = true
        }
    }
}

#Preview {
    LoadingView()
}
