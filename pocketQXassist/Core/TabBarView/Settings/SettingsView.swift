//
//  SettingsView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import SwiftUI

struct SettingsView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()

                VStack {
                    PrivacyButton(title: "Privacy Policy", iconImage: "Privacy")
                    SupportButton(title: "Support", iconImage: "Support")

                    Spacer()
                }
                .padding(.top, 16)
                .padding()
            }
            .toolbar {
                title
                dismissButton
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension SettingsView {
    private var title: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Settings")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
        }
    }

    private var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                dismiss()
            } label: {
                Text("Back")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SettingsView()
}
