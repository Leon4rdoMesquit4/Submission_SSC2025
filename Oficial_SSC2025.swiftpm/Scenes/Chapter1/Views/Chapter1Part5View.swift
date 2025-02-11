//
//  Chapter1Part1View 2.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter1Part5View: View {
    let action: (() -> Void)?
    @State var isCompleted = false
    
    var body: some View {
        part3
            .ignoresSafeArea()
    }
}

extension Chapter1Part5View {
    var part3: some View {
        ZStack(alignment: .center) {
            background
            
            paperImage
            
            captions
            
            bottomButton
        }
    }
    
    var background: some View {
        Chapter1PaintedBackground(hasBorder: .constant(true))
    }
    
    var paperImage: some View {
        VStack {
            Image(ImageConstants.tsuru)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer(minLength: SpacingContants.huge + SpacingContants.large)
        }
    }
    
    var captions: some View {
        VStack {
            Spacer()
            Text(captionText)
                .font(FontsConstants.body)
                .foregroundStyle(ColorsConstants.chpt1color1)
                .padding(.horizontal, SpacingContants.huge)
                .padding(.bottom, SpacingContants.ultraLarge + SpacingContants.medium)
        }
    }
    
    var bottomButton: some View {
        CustomButton(state: .play) {
            action?()
        }.foregroundStyle(ColorsConstants.chpt1color1)
    }
}

extension Chapter1Part5View {
    var captionText: String {
        "The Tsuru is a traditional symbol in origami art"
    }
}

#Preview {
    Chapter1Part5View(action: {
        print("Texted")
    })
}
