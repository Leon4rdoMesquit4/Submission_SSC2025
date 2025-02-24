//
//  Chapter2Part5View.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter2Part5View: View {
    let action: (() -> Void)?
    @State var stentXOffset: CGFloat = 50
    @State var assistIsOn = false
    @State var firstAnimationIsCompleted = false
    @State var secondAnimationIsCompleted = false
    
    var body: some View {
        part2
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + DurationConstants.long) {
                    assistIsOn = true
                }
            }
            .onChange(of: firstAnimationIsCompleted) { value in
                if value == true {
                    DispatchQueue.main.asyncAfter(deadline: .now() + DurationConstants.long) {
                        secondAnimationIsCompleted = true
                    }
                }
            }
    }
}

extension Chapter2Part5View {
    var part2: some View {
        ZStack(alignment: .bottom) {
            background
            
            if firstAnimationIsCompleted {
                arteryImage2
            } else {
                arteryImage1
            }
            
            captions
            
            if secondAnimationIsCompleted {
                bottomButton
            }
        }
    }
    
    var background: some View {
        Chapter2Background()
    }
    
    var arteryImage1: some View {
        VStack {
            Spacer()
            ZStack(alignment: .center) {
                Image(ImageConstants.blockedArtery1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(AppearanceConstants.arteryScaleEffect)
                    .gesture (
                        DragGesture()
                            .onChanged({ value in
                                if value.translation.height > -100 || value.translation.height < 100 {
                                    firstAnimationIsCompleted = true
                                }
                            })
                    )
                Image(ImageConstants.cable)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: .zero, y: -SpacingContants.small)
                Image(ImageConstants.stentCompressed)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.35)
                    .offset(x: stentXOffset, y: -SpacingContants.small)
            }.overlay(alignment: .leading) {
                ZStack {
                    Image(ImageConstants.assist2)
                        .offset(x: 620, y: assistIsOn ? -250 : -30)
                        .animation(.easeOut(duration: DurationConstants.long).repeatForever(autoreverses: false), value: assistIsOn)
                        .opacity(assistIsOn ? 1 : .zero)
                        .offset(x: 0, y: -SpacingContants.small)
                }
            }
            Spacer()
        }
    }
    
    
    var arteryImage2: some View {
        VStack {
            Spacer()
            ZStack(alignment: .center) {
                Image(secondAnimationIsCompleted ? ImageConstants.arteryCleaned3 : ImageConstants.arteryCleaned1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(AppearanceConstants.arteryScaleEffect)
                Image(ImageConstants.cable)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: secondAnimationIsCompleted ? -1300 : .zero, y: -SpacingContants.small)
                    .animation(.spring(duration: 1.5), value: secondAnimationIsCompleted)
                Image(ImageConstants.stentExpanded1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.40)
                    .offset(x: secondAnimationIsCompleted ? -900 : stentXOffset, y: -20)
                    .animation(.spring(duration: 1.5), value: secondAnimationIsCompleted)
                
                Image(ImageConstants.bloodFlow)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(1)
                    .offset(
                        x: secondAnimationIsCompleted ? .zero : -1500,
                        y: -10
                    )
                    .animation(.easeOut(duration: 3.5), value: secondAnimationIsCompleted)
                
                Image(secondAnimationIsCompleted ? ImageConstants.stentExpanded3 : ImageConstants.stentExpanded2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.22)
                    .offset(x: stentXOffset + 10, y: -15)
                Image(secondAnimationIsCompleted ? ImageConstants.arteryCleaned4 : ImageConstants.arteryCleaned2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.675)
                    .offset(x: stentXOffset + 9, y: -20)
            }
            Spacer()
        }
    }
    
    var captions: some View {
        Text(firstAnimationIsCompleted ? captionText2 : captionText1)
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

extension Chapter2Part5View {
    
    var captionText1: String {
        "Swipe to expand the stent and open the artery."
    }
    
    var captionText2: String {
        "The stent has expanded, allowing blood to flow normally again!"
    }
    
}

#Preview {
    Chapter2Part5View {
        
    }
}
