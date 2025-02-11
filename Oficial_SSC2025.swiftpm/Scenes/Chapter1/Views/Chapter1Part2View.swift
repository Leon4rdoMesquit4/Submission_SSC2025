//
//  Chapter1Part1View 2.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter1Part2View: View {
    let action: (() -> Void)?
    @State var isViewPresented = false
    
    var body: some View {
        part2
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.smooth) {
                    isViewPresented = true
                }
            }
    }
}

extension Chapter1Part2View {
    var part2: some View {
        ZStack(alignment: .bottom) {
            background
            
            VStack {
                Spacer()
                HStack(spacing: SpacingContants.huge) {
                    Image(ImageConstants.paperPainted)
                        .offset(x: .zero, y: SpacingContants.small)
                    Image(ImageConstants.origamiPainted)
                        .offset(x: .zero, y: SpacingContants.huge)
                }
                mountFuji
            }
            
            captions
            
            bottomButton
        }
    }
    
    var background: some View {
        Chapter1PaintedBackground(hasBorder: .constant(true))
    }
    
    var mountFuji: some View {
        MountFuji(isPainted: .constant(true))
            .padding(.bottom, -SpacingContants.maximum)
            .padding(.top, SpacingContants.ultraLarge)
            .scaleEffect(!isViewPresented ? 1: 1.8)
            .offset(x:!isViewPresented ? 0 : -SpacingContants.mountXOffset, y: !isViewPresented ? 0 : -SpacingContants.mountYOffset)
    }
    
    var captions: some View {
        Text(captionText)
            .font(FontsConstants.body)
            .foregroundStyle(ColorsConstants.chpt1color2)
            .offset(x: .zero, y: -SpacingContants.ultraLarge - SpacingContants.medium)
            .padding(.horizontal, SpacingContants.huge)
    }
    
    var bottomButton: some View {
        CustomButton(state: .play) {
            action?()
        }.foregroundStyle(ColorsConstants.chpt1color2)
            .shadow(radius: AppearanceConstants.shadowBlur)
    }
}

extension Chapter1Part2View {
    var captionText: String {
        "With a single piece of paper, endless creations are possible"
    }
}

#Preview {
    Chapter1Part2View(action: {
        print("Texted")
    })
}
