//
//  Chapter1Part1View 2.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//


import SwiftUI

struct Chapter1Part2View: View {
    let action: (() -> Void)?
    
    var body: some View {
        ZStack {
            Chapter1PaintedBackground(hasBorder: .constant(true))
            CustomButton(state: .play) {
                withAnimation {
                    action?()
                }
            }.foregroundStyle(ColorsConstants.chpt1color1)
        }.ignoresSafeArea()
    }
}
