//
//  RegNowView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 19.01.2024.
//

import SwiftUI

struct RegNowView: View {

    @Binding var showView: Bool

    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                HStack {
                    Text("Already ")
                    +
                    Text("652 716 ")
                        .foregroundColor(Color.theme.customOrange)
                    +
                    Text("users have registered and are earning right now!")
                }
                .font(.system(size: 24, weight: .bold))
                .padding()

                Image("RegNow")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 402)
                    .padding(.top, 30)

                Spacer()
                bottomButton
            }
        }
    }
}

//MARK: COMPONENTS
extension RegNowView {
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
    RegNowView(showView: .constant(false))
        .preferredColorScheme(.dark)
}
