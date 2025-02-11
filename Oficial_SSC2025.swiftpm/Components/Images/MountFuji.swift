//
//  MountFuji.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 04/02/25.
//

import SwiftUI

struct MountFuji: View {
    @Binding var isPainted: Bool
    
    var body: some View {
        Image(isPainted ? ImageConstants.fujiPainted : ImageConstants.fujiColored)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.top, SpacingContants.extraUltraLarge)
    }
}
