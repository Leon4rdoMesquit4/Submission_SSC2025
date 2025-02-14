//
//  Chapter1Part1View 2.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter2Part3View: View {
    let action: (() -> Void)?
    
    var body: some View {
        part2
            .ignoresSafeArea()
    }
}

extension Chapter2Part3View {
    var part2: some View {
        ZStack(alignment: .bottom) {
            background
            
            VStack {
                Spacer()
                stentImage
                Spacer()
            }
            
            captions
            
            bottomButton
        }
    }
    
    var background: some View {
        Chapter2Background()
    }
    
    var stentImage: some View {
        Image(ImageConstants.stents)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(0.8)
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

extension Chapter2Part3View {
    
    var captionText: String {
        "This stent uses an origami-inspired folding technique to stay compact and expand when needed."
    }
    
}

#Preview {
    Chapter2View(changeToNextChapter: .constant(.two))
}
