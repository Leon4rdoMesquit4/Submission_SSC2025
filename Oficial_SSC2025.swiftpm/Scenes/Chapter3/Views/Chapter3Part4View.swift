//
//  Chapter2Part2View.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//

import SwiftUI

struct Chapter3Part4View: View {
    let action: (() -> Void)?
    @State var isCompleted = false
    @State var assistIsOn = false
    @State var paperNumber: Int = 1
    let timer = Timer.publish(every: DurationConstants.tiny * DurationConstants.long, on: .main, in: .common).autoconnect()
    
    var body: some View {
        part3
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + DurationConstants.long) {
                    assistIsOn = true
                }
            }
            .onReceive(timer) { t in
                if isCompleted && paperNumber < 5 {
                    paperNumber += 1
                }
            }
    }
}

extension Chapter3Part4View {
    var part3: some View {
        ZStack(alignment: .bottom) {
            background
            
            jamesWebbImage
            
            captions
            
            if isCompleted {
                bottomButton
            }
        }
    }
    
    var background: some View {
        Chapter3Background()
    }
    
    var jamesWebbImage: some View {
        Image(ImageConstants.jamesWebb + "\(paperNumber)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .gesture (
                MagnificationGesture()
                    .onChanged({ value in
                        if value > 2.5 {
                            isCompleted = true
                            assistIsOn = false
                        }
                    })
            )
            .overlay(alignment: .leading) {
                ZStack {
                    Image(ImageConstants.assist2)
                        .offset(x: assistIsOn ? 760 : 600, y: assistIsOn ? -100 : -30)
                        .animation(.easeOut(duration: DurationConstants.long).repeatForever(autoreverses: false), value: assistIsOn)
                        .opacity(assistIsOn ? 1 : .zero)
                        .offset(x: 0, y: -SpacingContants.small)
                    
                    Image(ImageConstants.assist2)
                        .offset(x: assistIsOn ? 250 : 420, y: assistIsOn ? 100 : 30)
                        .animation(.easeOut(duration: DurationConstants.long).repeatForever(autoreverses: false), value: assistIsOn)
                        .opacity(assistIsOn ? 1 : .zero)
                        .offset(x: 0, y: -SpacingContants.small)
                }
            }
    }
    
    var captions: some View {
        Text(isCompleted ? captionText2 : captionText1)
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

extension Chapter3Part4View {
    var captionText1: String {
        "Swipe to unfold the telescope’s sunshield, just like it did in space."
    }
    
    var captionText2: String {
        "The sunshield is now fully deployed, allowing James Webb to capture stunning images of the universe!"
    }
}

#Preview {
    Chapter3Part4View {
        
    }
}
