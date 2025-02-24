//
//  FontsConstants.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 31/01/25.
//

import SwiftUI

enum FontsConstants {
    static let mainTitle = fetchFont(weight: .extraBold, fontSize: 68)
    static let oriTitle = fetchFont(weight: .semiBold, fontSize: 67)
    static let oriTitle2 = fetchFont(weight: .semiBold, fontSize: 50)
    static let credits = fetchFont(weight: .regular, fontSize: 33)
    static let subtitle = fetchFont(weight: .regular, fontSize: 32)
    static let subtitle2 = fetchFont(weight: .regular, fontSize: 23)
    static let body = fetchFont(weight: .medium, fontSize: 23)
    static let bodyBolded = fetchFont(weight: .bold, fontSize: 23)
    static let buttonBody = fetchFont(weight: .regular, fontSize: 18)
}

func fetchFont(weight: FontWeight, fontSize: CGFloat) -> Font {
    let font: Font
    guard let URL = Bundle.main.url(forResource: "HeptaSlab-\(weight.rawValue)", withExtension: "ttf") else {
        print("oi")
        return Font.title
    }
    
    CTFontManagerRegisterFontsForURL(URL as CFURL, CTFontManagerScope.process, nil)
    
    let uiFont = UIFont(name: "HeptaSlab-\(weight.rawValue)", size: fontSize)
    
    font = Font(uiFont ?? UIFont())
    
    return font
}

enum FontWeight: String {
    case light = "Light"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case medium = "Medium"
    case bold = "Bold"
    case extraBold = "ExtraBold"
}
