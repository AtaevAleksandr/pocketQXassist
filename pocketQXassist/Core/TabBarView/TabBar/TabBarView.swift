//
//  TabBarView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import SwiftUI

struct TabBarView: View {

    init() {
        let coloredNavBarAppearance = UINavigationBarAppearance()
        coloredNavBarAppearance.configureWithOpaqueBackground()
        coloredNavBarAppearance.backgroundColor = UIColor(Color.theme.background)

        UINavigationBar.appearance().standardAppearance = coloredNavBarAppearance
        UINavigationBar.appearance().compactAppearance = coloredNavBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavBarAppearance

        let coloredTabBarAppearance = UITabBarAppearance()
        coloredTabBarAppearance.configureWithOpaqueBackground()
        coloredTabBarAppearance.backgroundColor = UIColor(Color.theme.background)

        UITabBar.appearance().standardAppearance = coloredTabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = coloredTabBarAppearance
    }

    @State private var selectedTab: Int = 1
    @State private var isShowSettingsView: Bool = false

    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem { Label("Home", image: "Home") }.tag(1)

                IdeasView()
                    .tabItem { Label("Ideas", image: "Ideas") }.tag(2)

                VolatilityView()
                    .tabItem { Label("Volatility", image: "Volatility") }.tag(3)
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(.leading, 0.5)
            .accentColor(Color.theme.customOrange)
            .toolbar {
                titles
                settingsButton
            }
        }
    }
}

extension TabBarView {
    private var titles: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text(selectedTab == 1 ? "Home" : (selectedTab == 2 ? "Trade Ideas" : "Currency Heatwave"))
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
        }
    }

    private var settingsButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                isShowSettingsView.toggle()
            } label: {
                Image("Settings")
            }
            .fullScreenCover(isPresented: $isShowSettingsView) {
                SettingsView()
            }
        }
    }
}

#Preview {
    TabBarView()
        .preferredColorScheme(.dark)
        .environmentObject(PairViewModel())
        .environmentObject(PostViewModel())
        .environmentObject(HeatWaveViewModel())
}
