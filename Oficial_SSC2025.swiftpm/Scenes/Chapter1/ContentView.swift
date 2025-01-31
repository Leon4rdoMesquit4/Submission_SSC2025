import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            gradientBackground
        }.ignoresSafeArea()
    }
    
}

extension ContentView {
    var gradientBackground: some View {
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
