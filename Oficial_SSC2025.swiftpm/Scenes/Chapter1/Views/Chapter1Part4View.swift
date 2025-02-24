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
    }
}

extension Chapter1Part4View {
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
            Image(ImageConstants.tsuruFolded + "\(paperNumber)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(alignment: .trailing) {
                    Image(ImageConstants.assist)
                        .offset(x: assistIsOn ? -200 : -400, y: assistIsOn ? 100 : -100)
                        .animation(.easeOut(duration: DurationConstants.long).repeatForever(autoreverses: false), value: assistIsOn)
                        .opacity(assistIsOn && !isCompleted ? 1 : 0)
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            if !isCompleted {
                                if value.translation.width > 50 &&
                                    value.translation.height > 100
                                {
                                    isCompleted = true
                                }
                            }
                        })
                ).onReceive(timer) { t in
                    if isCompleted && paperNumber < 5 {
                        paperNumber += 1
                    }
                }
        }.offset(x: -10, y: 0)
    }
    
    var captions: some View {
        VStack {
            Spacer()
            Text(isCompleted ? captionText2 : captionText1)
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
    var captionText1: String {
        "Swipe to finish the tsuru!"
    }
    var captionText2: String {
        "Like magic, you've crafted a Tsuru."
    }
}

#Preview {
    Chapter1Part4View(action: {
    })
}
