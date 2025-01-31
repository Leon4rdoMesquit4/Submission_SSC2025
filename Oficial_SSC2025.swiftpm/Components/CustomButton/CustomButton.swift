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
        HStack {
            if let text = text {
                VerticalWordStack(text: text)
            }
            
            Button {
                buttonAction?()
            } label: {
                Image(state.imageName)
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

#Preview {
    CustomButton(state: .next, text: "Oi Safado")
}
