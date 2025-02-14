//
//  Chapter1Part1View 2.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter1Part3View: View {
    let action: (() -> Void)?
    @State var isCompleted = false
    @State var assistIsOn = false
    @State var paperNumber: Int = 1
    let timer = Timer.publish(every: DurationConstants.tiny * DurationConstants.long, on: .main, in: .common).autoconnect()
    
    var body: some View {
        part3
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + DurationConstants.huge) {
                    assistIsOn = true
                }
            }
    }
}

extension Chapter1Part3View {
    var part3: some View {
        ZStack(alignment: .center) {
            background
            
            paperImage
                
            
            captions
            
            if isCompleted {
                bottomButton
            }
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
                    Image(ImageConstants.assist)
                        .offset(x: assistIsOn ? -SpacingContants.firstAssistXOffset : .zero, y: assistIsOn ? -SpacingContants.firstAssistYOffset1 : SpacingContants.firstAssistYOffset2)
                        .animation(.easeOut(duration: DurationConstants.huge).repeatForever(autoreverses: false), value: assistIsOn)
                        .opacity(assistIsOn && !isCompleted ? 1 : .zero)
                }
        }.gesture(
            DragGesture()
                .onChanged({ value in
                    if !isCompleted {
                        if value.translation.width < -100
                            &&
                            value.translation.height < -100 {
                            isCompleted = true
                        }
                    }
                })
        ).onReceive(timer) { t in
            if isCompleted && paperNumber < 5 {
                paperNumber += 1
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

extension Chapter1Part3View {
    var captionText: String {
        "Swipe to fold the paper!"
    }
}

#Preview {
    Chapter1Part3View(action: {
        print("Texted")
    })
}
