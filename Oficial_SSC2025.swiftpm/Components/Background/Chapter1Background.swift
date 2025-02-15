//
//  Chapter1background.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 03/02/25.
//

import SwiftUI

struct Chapter1PaintedBackground: View {
    @Binding var hasBorder: Bool
    
    var body: some View {
        ZStack {
            ColorsConstants.chpt1bgcolor
                .overlay {
                    Image(ImageConstants.dirtyEffect)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            if hasBorder {
                Rectangle()
                    .stroke(style:.init(lineWidth: AppearanceConstants.lineWidth))
                    .padding(SpacingContants.mediumLarge)
                    .foregroundStyle(ColorsConstants.chpt1color1)
            }
        }
    }
}
