//
//  Chapter2Part2View.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//

import SwiftUI

struct Chapter3Part2View: View {
    let action: (() -> Void)?
    
    var body: some View {
        part2
            .ignoresSafeArea()
    }
}

extension Chapter3Part2View {
    var part2: some View {
        ZStack(alignment: .bottom) {
            background
            
            VStack {
                Spacer()
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
        Image(ImageConstants.jamesWebbFolded)
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

extension Chapter3Part2View {
    var captionText: String {
        "The James Webb Space Telescope was launched folded to fit inside a rocket and unfolded in space."
    }
}

#Preview {
    Chapter3Part2View {
        
    }
}
