//
//  Chapter2Part4View.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter2Part4View: View {
    let action: (() -> Void)?
    @State var stentXOffset: CGFloat = -SpacingContants.stentXOffset
    @State var lastPosition: CGFloat = -SpacingContants.stentXOffset
    @State var assistIsOn = false
    @State var firstAnimationIsCompleted = false
    
    var body: some View {
        part2
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + DurationConstants.long) {
                    assistIsOn = true
                }
            }
    }
}

extension Chapter2Part4View {
    var part2: some View {
        ZStack(alignment: .bottom) {
            background
            
            arteryImage
            
            captions
        }
    }
    
    var background: some View {
        Chapter2Background()
    }
    
    var arteryImage: some View {
        VStack {
            Spacer()
            ZStack(alignment: .center) {
                Image(ImageConstants.blockedArtery1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(AppearanceConstants.arteryScaleEffect)
                Image(ImageConstants.cable)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: .zero, y: -SpacingContants.small)
                Image(ImageConstants.stentCompressed)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.35)
                    .offset(x: stentXOffset, y: -SpacingContants.small)
                    .gesture(
                        DragGesture()
                            .onEnded({ value in
                                lastPosition = lastPosition + value.translation.width
                            })
                            .onChanged({ value in
                                assistIsOn = false
                                if stentXOffset < 50 {
                                    stentXOffset = lastPosition + value.translation.width
                                    print(stentXOffset)
                                } else {
                                    stentXOffset = 50
                                    action?()
                                }
                            })
                    )
            }.overlay(alignment: .leading) {
                Image(ImageConstants.assist2)
                    .offset(x: assistIsOn ? SpacingContants.firstAssistXOffset : 0, y: assistIsOn ? 0 : 0)
                    .animation(.easeOut(duration: DurationConstants.extraLong).repeatForever(autoreverses: false), value: assistIsOn)
                    .opacity(assistIsOn ? 1 : .zero)
                    .offset(x: 0, y: -SpacingContants.small)
            }
            Spacer()
        }
    }
    
    var captions: some View {
        Text(firstAnimationIsCompleted ? captionText2 : captionText)
            .font(FontsConstants.body)
            .foregroundStyle(ColorsConstants.chpt2color)
            .offset(x: .zero, y: -SpacingContants.ultraLarge - SpacingContants.medium)
            .padding(.horizontal, SpacingContants.huge)
    }
}

extension Chapter2Part4View {
    
    var captionText: String {
        "Drag the folded stent to the blocked area to restore blood flow."
    }
    
    var captionText2: String {
        "Pinch outward to expand the stent and open the artery."
    }
    
}

#Preview {
    Chapter2Part4View {
        
    }
}
