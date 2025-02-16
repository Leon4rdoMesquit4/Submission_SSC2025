//
//  Chapter2Part2View.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//

import SwiftUI

struct Chapter3Part3View: View {
    let action: (() -> Void)?
    
    var body: some View {
        part3
            .ignoresSafeArea()
    }
}

extension Chapter3Part3View {
    var part3: some View {
        ZStack(alignment: .bottom) {
            background
            
            VStack {
                jamesWebbImage
                Spacer()
            }
            
            captions
            
            bottomButton
        }
    }
    
    var background: some View {
        Chapter3Background()
    }
    
    var jamesWebbImage: some View {
        Image(ImageConstants.sunshield)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(0.8)
    }
    
    var captions: some View {
        Text(captionText)
            .font(FontsConstants.body)
            .foregroundStyle(ColorsConstants.chpt3color)
            .offset(x: .zero, y: -SpacingContants.ultraLarge - SpacingContants.medium)
            .padding(.horizontal, SpacingContants.huge)
    }
    
    var bottomButton: some View {
        CustomButton(state: .play) {
            action?()
        }.foregroundStyle(ColorsConstants.chpt3color)
    }
}

extension Chapter3Part3View {
    var captionText: String {
        "Its massive sunshield, inspired by origami, protects the telescope from the Sun’s heat and light."
    }
}

#Preview {
    Chapter3Part3View {
        
    }
}
