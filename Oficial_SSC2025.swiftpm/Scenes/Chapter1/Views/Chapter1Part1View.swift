//
//  SwiftUIView.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//

import SwiftUI

struct Chapter1Part1View: View {
    var body: some View {
        ZStack {
            Chapter1PaintedBackground(hasBorder: true)
            VStack {
                Spacer()
                HStack(alignment: .bottom, spacing: SpacingContants.small) {
                    Text("Origami")
                        .font(FontsConstants.oriTitle)
                    Text("is an")
                        .font(FontsConstants.subtitle2)
                        .padding(.bottom, SpacingContants.small)
                }
                Text("ancient art form that emerged thousands of years ago")
                    .font(FontsConstants.subtitle2)
                MountFuji(isPainted: .constant(true))
                    .padding(.bottom, -SpacingContants.maximum)
                    .padding(.top, SpacingContants.ultraLarge)
            }
            CustomButton(state: .play) {
                
            }.foregroundStyle(ColorsConstants.chpt1color2)
                .shadow(radius: SizeConstants.shadowBlur)
        }.ignoresSafeArea()
    }
}

#Preview {
    Chapter1Part1View()
}
