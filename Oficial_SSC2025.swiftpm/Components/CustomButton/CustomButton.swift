//
//  SwiftUIView.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 31/01/25.
//

import SwiftUI

struct CustomButton: View {
    let state: ButtonState
    var text: String?
    var buttonAction: (() -> Void)?
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                HStack(spacing: SpacingContants.medium) {
                    if let text = text {
                        VerticalWordStack(text: text)
                    }
                    
                    Button {
                        buttonAction?()
                    } label: {
                        Image(state.imageName)
                            .renderingMode(.template)
                    }
                }.padding([.bottom, .trailing], SpacingContants.ultraLarge)
            }
        }
    }
}

struct VerticalWordStack: View {
    let text: String
    
    var body: some View {
        VStack(alignment: .trailing) {
            ForEach(text.components(separatedBy: " "), id: \.self) { word in
                Text(word)
                    .font(FontsConstants.buttonBody)
            }
        }
    }
}

enum ButtonState {
    case restart
    case play
    
    var imageName: String {
        switch self {
        case .restart: return ImageConstants.restartButton
        case .play: return ImageConstants.playbutton
        }
    }
}

#Preview {
    CustomButton(state: .play, text: "Oi Safado")
}
