//
//  MenuGradientBackground.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 03/02/25.
//

import SwiftUI

struct MenuBackground: View {
    var body: some View {
        LinearGradient(stops: [
            .init(
                color: ColorsConstants.c1Gradiente,
                location: GradientConstants.c1Stop
            ),.init(
                color: ColorsConstants.c2Gradiente,
                location: GradientConstants.c2Stop
            ),.init(
                color: ColorsConstants.c3Gradiente,
                location: GradientConstants.c3Stop
            ),.init(
                color: ColorsConstants.c4Gradiente,
                location: GradientConstants.c4Stop
            ),
        ], startPoint: .top, endPoint: .bottom)
    }
}
