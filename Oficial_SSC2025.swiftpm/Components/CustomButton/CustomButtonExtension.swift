//
//  CustomButtonExtension.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 31/01/25.
//

extension ButtonState {
    var imageName: String {
        switch self {
        case .next: return ImageConstants.nextButton
        case .restart: return ImageConstants.restartButton
        }
    }
}
