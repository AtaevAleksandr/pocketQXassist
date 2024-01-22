//
//  RegSuccessfullView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 19.01.2024.
//

import SwiftUI

struct RegSuccessfullView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Spacer()

                Image("RegComplete")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 111, height: 111)

                Text("Registration completed")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 26)

                Spacer()

                bottomButton
            }
        }
    }
}

//MARK: COMPONENTS
extension RegSuccessfullView {
    private var bottomButton: some View {
        Button {
            dismiss()
        } label: {
            Text("Next")
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
    RegSuccessfullView()
        .preferredColorScheme(.dark)
}
