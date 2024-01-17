//
//  NotificationsView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Don't miss \nthe notification from AI bot")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)

            Spacer()
            
            ZStack {
                Image("Ellipse")
                    .resizable()
                    .scaledToFit()
                Image("iPhoneNotification")
                    .resizable()
                    .scaledToFit()
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ZStack {
        BackgroundView()
        NotificationsView()
    }
}
