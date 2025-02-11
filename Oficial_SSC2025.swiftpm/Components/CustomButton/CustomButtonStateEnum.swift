//
//  ButtonStateEnum.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 31/01/25.
//

enum ButtonState {
    case next
    case restart
    case play
    
    var imageName: String {
        switch self {
        case .next: return ImageConstants.nextButton
        case .restart: return ImageConstants.restartButton
        case .play: return ImageConstants.playbutton
        }
    }
}
