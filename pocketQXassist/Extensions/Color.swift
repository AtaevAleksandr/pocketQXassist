//
//  Color.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import Foundation
import SwiftUI

extension Color {

    static let theme = ColorTheme()
}

struct ColorTheme {
    let background: Color = Color("BackgroundColor")
    let customOrange: Color = Color("CustomOrangeColor")
    let backgroundComponents: Color = Color("BackgroundComponents")
    let customGray: Color = Color("CustomGrayColor")
    let border: Color = Color("BorderColor")
    let backgroundBar: Color = Color("BackgroundBarColor")
    let customGreen: Color = Color("CustomGreenColor")
    let customRed: Color = Color("CustomRedColor")
    let backgroundWeb: Color = Color("BackgroundWeb")
}
