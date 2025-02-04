//
//  Chapter1background.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 03/02/25.
//

import SwiftUI

struct Chapter1PaintedBackground: View {
    @State var hasBorder: Bool = false
    
    var body: some View {
        ZStack {
            ColorsConstants.chpt1bgcolor
                .overlay {
                    Image(ImageConstants.dirtyEffect)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            if hasBorder {
                Rectangle()
                    .stroke(style:.init(lineWidth: SizeConstants.lineWidth))
                    .padding(SpacingContants.mediumLarge)
            }
        }
    }
}

