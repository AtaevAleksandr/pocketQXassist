//
//  DepNowView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 19.01.2024.
//

import SwiftUI

struct DepNowView: View {

    @Binding var showView: Bool

    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Spacer()

                Image("DepNow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 111, height: 111)

                Text("Congratulations! \nYour demo account is growing. Start earning from your first deposit now!")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding(.top, 26)

                Spacer()

                bottomButton
            }
        }
    }
}

//MARK: COMPONENTS
extension DepNowView {
    private var bottomButton: some View {
        Button {
            showView.toggle()
        } label: {
            Text("Continue")
                .font(.callout)
                .foregroundStyle(.black)
                .frame(height: 53)
                .frame(maxWidth: .infinity)
                .background(Color.theme.customOrange)
                .cornerRadius(10)
                .animation(nil, value: UUID())
                .padding()
        }
    }
}

#Preview {
    DepNowView(showView: .constant(false))
}
