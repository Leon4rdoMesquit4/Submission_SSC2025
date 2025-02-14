//
//  Chapter1Part1View 2.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter2Part2View: View {
    let action: (() -> Void)?
    
    var body: some View {
        part2
            .ignoresSafeArea()
    }
}

extension Chapter2Part2View {
    var part2: some View {
        ZStack(alignment: .bottom) {
            background
            
            blockedArteryImage
            
            captions
            
            bottomButton
        }
    }
    
    var background: some View {
        Chapter2Background()
    }
    
    var blockedArteryImage: some View {
        Image(ImageConstants.blockedArtery)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    var captions: some View {
        Text(captionText)
            .font(FontsConstants.body)
            .foregroundStyle(ColorsConstants.chpt2color)
            .offset(x: .zero, y: -SpacingContants.ultraLarge - SpacingContants.medium)
            .padding(.horizontal, SpacingContants.huge)
    }
    
    var bottomButton: some View {
        CustomButton(state: .play) {
            action?()
        }.foregroundStyle(ColorsConstants.chpt2color)
    }
}

extension Chapter2Part2View {
    
    var captionText: String {
        "When an artery becomes too narrow due to plaque buildup, blood flow is restricted. A stent is used to open the artery and keep it clear, preventing serious conditions like heart attacks or strokes."
    }
    
}

#Preview {
    Chapter2View(changeToNextChapter: .constant(.two))
}
