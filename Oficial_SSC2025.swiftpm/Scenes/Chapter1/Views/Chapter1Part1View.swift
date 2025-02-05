//
//  SwiftUIView.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//

import SwiftUI

struct Chapter1Part1View: View {
    let action: (() -> Void)?
    @State var hasBorder: Bool = false
    @State var isViewPresented: Bool = false
    
    var body: some View {
        part1
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.smooth)  {
                    isViewPresented = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + DurationConstants.short + DurationConstants.extraShort) {
                    withAnimation(.smooth) {
                        hasBorder = true
                    }
                }
            }
    }
}

extension Chapter1Part1View {
    var part1: some View {
        ZStack {
            background
            VStack {
                Spacer()
                if isViewPresented {
                    text
                }
                mountFuji
            }
            bottomButton
        }
    }
    
    var background: some View {
        Chapter1PaintedBackground(hasBorder: $hasBorder)
    }
    
    var text: some View {
        VStack{
            Spacer()
            HStack(alignment: .bottom, spacing: SpacingContants.small) {
                Text(origamiTitle)
                    .font(FontsConstants.oriTitle)
                Text(origamiSubtitle1)
                    .font(FontsConstants.subtitle2)
                    .padding(.bottom, SpacingContants.small)
            }
            Text(origamiSubtitle2)
                .font(FontsConstants.subtitle2)
        }
    }
    
    var mountFuji: some View {
        MountFuji(isPainted: .constant(true))
            .padding(.bottom, isViewPresented ? -SpacingContants.maximum : .zero)
            .padding(.top, isViewPresented ? SpacingContants.ultraLarge : .zero)
    }
    
    var bottomButton: some View {
        CustomButton(state: .play) {
            action?()
        }.foregroundStyle(ColorsConstants.chpt1color2)
            .shadow(radius: SizeConstants.shadowBlur)
    }
}

extension Chapter1Part1View {
    var origamiTitle: String {
        "Origami"
    }
    var origamiSubtitle1: String {
        "is an"
    }
    var origamiSubtitle2: String {
        "ancient art form that emerged thousands of years ago"
    }
}
