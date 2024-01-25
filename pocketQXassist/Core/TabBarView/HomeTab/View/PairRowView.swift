//
//  PairRowView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import SwiftUI

struct PairRowView: View {

    let pair: PairModel
    @State private var isExpanded = false

    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            VStack {
                ScaleView(pairValue: PairModel(iconImage: pair.iconImage, name: pair.name, value: 10.0 - pair.value))
                    .padding(.top, 30)

                Text("\(pair.value, specifier: "%.2f")")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 30)
            }
        } label: {
            HStack {
                Image(pair.iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)

                Text(pair.name)
                    .font(.system(size: 16))
                    .foregroundStyle(.white)

                Spacer()

                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.gray)
                    .padding(.trailing, -20)
                    .animation(.none, value: UUID())
            }
            .frame(height: 15)
        }
        .tint(.clear)
        .padding()
        .background(
            Group {
                if isExpanded {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.theme.backgroundComponents)

                        Color.theme.backgroundBar
                            .roundedCorner(.infinity, corners: [.bottomLeft, .bottomRight])
                            .frame(height: 40)
                            .offset(y: 77)
                    }
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.theme.backgroundComponents)
                }
            }
        )
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.theme.border)
        }
    }
}

#Preview {
    ZStack {
        BackgroundView()
        PairRowView(pair: PairModel(iconImage: "AUD:USD", name: "AUD/USD", value: 3.96))
    }
    .preferredColorScheme(.dark)
}
