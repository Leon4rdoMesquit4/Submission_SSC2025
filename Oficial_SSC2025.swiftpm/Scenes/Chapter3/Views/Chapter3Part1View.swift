//
//  Chapter2Part1View.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//

import SwiftUI

struct Chapter3Part1View: View {
    let action: (() -> Void)?
    
    var body: some View {
        part1
            .ignoresSafeArea()
    }
}

extension Chapter3Part1View {
    var part1: some View {
        ZStack(alignment: .bottom) {
            background
            HStack {
                VStack {
                    Spacer()
                }
                Spacer()
                VStack {
                    text
                }.frame(alignment: .center)
            }
            bottomButton
        }
    }
    
    var background: some View {
        Chapter3Background()
    }
    
    var text: some View {
        VStack{
            HStack(alignment: .bottom, spacing: SpacingContants.small) {
                Text(origamiTitle)
                    .font(FontsConstants.oriTitle)
                Text(origamiSubtitle1)
                    .font(FontsConstants.subtitle2)
                    .padding(.bottom, SpacingContants.small)
            }
            Text(origamiSubtitle2)
                .font(FontsConstants.subtitle2)
        }.padding(.trailing, SpacingContants.ultraLarge)
            .foregroundStyle(ColorsConstants.chpt3color)
    }
    
    var building: some View {
        Image(ImageConstants.building)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.top, SpacingContants.extraUltraLarge)
    }
    
    var bottomButton: some View {
        CustomButton(state: .play) {
            action?()
        }.foregroundStyle(ColorsConstants.chpt3color)
    }
}

extension Chapter3Part1View {
    var origamiTitle: String {
        "Origamiii"
    }
    var origamiSubtitle1: String {
        "is also used"
    }
    var origamiSubtitle2: String {
        "in space engineering to create compact, deployable structures."
    }
}

#Preview {
    Chapter3View(changeToNextChapter: .constant(.two))
}
