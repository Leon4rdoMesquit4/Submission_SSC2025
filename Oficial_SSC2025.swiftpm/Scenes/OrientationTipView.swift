//
//  OrientationTipView.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 20/02/25.
//

import SwiftUI

struct OrientationTipView: View {
    var body: some View {
        ZStack {
            Image(ImageConstants.orientationTipBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Image(ImageConstants.orientationTipImage)
            
            VStack {
                Spacer()
                Text("Before you begin, ensure your")
                    .font(FontsConstants.buttonBody)
                Text("device is in LANDSCAPE MODE!")
                    .font(FontsConstants.buttonBody)
                    
            }.padding(SpacingContants.extraUltraLarge + SpacingContants.large)
                .foregroundStyle(ColorsConstants.chpt1white)
        }.ignoresSafeArea()
    }
}

#Preview {
    OrientationTipView()
}
