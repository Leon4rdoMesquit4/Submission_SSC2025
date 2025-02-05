//
//  Chapter1Part1View 2.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter1Part4View: View {
    let action: (() -> Void)?
    @State var isCompleted = false
    @State var paperNumber: Int = 5
    
    var body: some View {
        part3
            .ignoresSafeArea()
    }
}

extension Chapter1Part4View {
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
            Image(ImageConstants.paper + "\(paperNumber)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(alignment: .trailing) {
                    Image(ImageConstants.arrow)
                        .offset(x: 10, y: 150)
                }
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

extension Chapter1Part4View {
    var captionText: String {
        "Like magic, you've crafted a Tsuru."
    }
}

#Preview {
    Chapter1Part4View(action: {
        print("Texted")
    })
}
