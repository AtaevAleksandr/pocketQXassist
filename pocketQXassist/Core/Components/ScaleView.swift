import SwiftUI

struct ScaleView: View {

    @State private var barLimit: Float = 10
    let pairValue: PairModel

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0...10, id: \.self) { number in
                    Text("\(number)")
                        .frame(width: UIScreen.main.bounds.width / 13)
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }

            ColoredScaleView(barTotal: CGFloat(barLimit), barValue: CGFloat(pairValue.value))
        }
    }
}

struct ColoredScaleView: View {

    let barTotal: CGFloat
    let barValue: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .trailing) {
                Image("Scale")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: .infinity))

                Rectangle()
                    .foregroundStyle(Color.theme.backgroundBar)
                    .frame(width: geometry.size.width * CGFloat(barValue) / CGFloat(barTotal))
                    .roundedCorner(.infinity, corners: [.topRight, .bottomRight])
            }
        }
        .frame(height: 25)
    }
}

#Preview {
    ScaleView(pairValue: PairModel(iconImage: "USD:EUR", name: "USD/EUR", value: 3))
}
