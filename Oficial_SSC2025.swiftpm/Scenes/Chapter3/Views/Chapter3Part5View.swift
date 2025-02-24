//
//  Chapter2Part2View.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//

import SwiftUI

struct Chapter3Part5View: View {
    let action: (() -> Void)?
    
    var body: some View {
        part3
            .ignoresSafeArea()
    }
}

extension Chapter3Part5View {
    var part3: some View {
        ZStack(alignment: .center) {
            background
            
            text
            
            bottomButton
        }
    }
    
    var background: some View {
        Chapter3Background()
    }
    
    var text: some View {
        VStack (spacing: 20){
            VStack {
                HStack(alignment: .bottom) {
                    Text(text1Part1)
                        .font(FontsConstants.body)
                        .foregroundStyle(ColorsConstants.chpt3color)
                        .offset(x: 0, y: -10)
                    Text(text1Part2)
                        .font(FontsConstants.oriTitle2)
                        .foregroundStyle(ColorsConstants.chpt3color)
                    Text(text1Part3)
                        .font(FontsConstants.body)
                        .foregroundStyle(ColorsConstants.chpt3color)
                        .offset(x: 0, y: -10)
                }
                Text(text1Part4)
                    .font(FontsConstants.body)
                    .foregroundStyle(ColorsConstants.chpt3color)
            }
            
            VStack {
                HStack(alignment: .bottom) {
                    Text(text2Part1)
                        .font(FontsConstants.oriTitle2)
                        .foregroundStyle(ColorsConstants.chpt3color)
                    Text(text2Part2)
                        .font(FontsConstants.body)
                        .foregroundStyle(ColorsConstants.chpt3color)
                        .offset(x: 0, y: -10)
                }
                HStack {
                    Text(text2Part3)
                        .font(FontsConstants.body)
                        .foregroundStyle(ColorsConstants.chpt3color)
                    Text(text2Part4)
                        .font(FontsConstants.bodyBolded)
                        .foregroundStyle(ColorsConstants.chpt3color)
                }
            }
        }
    }
    
    var bottomButton: some View {
        CustomButton(state: .play) {
            action?()
        }.foregroundStyle(ColorsConstants.chpt3color)
    }
}

extension Chapter3Part5View {
    
    var text1Part1: String {
        "From a simple sheet of"
    }
    
    var text1Part2: String {
        "paper"
    }
    
    var text1Part3: String {
        ", humanity has created groundbreaking "
    }
    
    var text1Part4: String {
        "solutions from life-saving medical devices to space exploration."
    }
    
    var text2Part1: String {
        "Origami"
    }
    
    var text2Part2: String {
        " proves that even the simplest ideas can lead to incredible "
    }
    
    var text2Part3: String {
        "innovations."
    }
    
    var text2Part4: String {
        "What will you create to change the world?"
    }
}

#Preview {
    Chapter3Part5View {
        
    }
}
