import SwiftUI

struct Chapter1View: View {
    var body: some View {
        ZStack {
            gradientBackground
            HStack(alignment: .bottom) {
                Spacer()
                VStack {
                    Spacer()
                    CustomButton(state: .play, text: "Start Journey")
                        .foregroundStyle(ColorsConstants.chpt1white).padding(EdgeInsets(top: 0, leading: 0, bottom: SpacingContants.ultraLarge, trailing: SpacingContants.ultraLarge))
                }
            }
        }.ignoresSafeArea()
    }
}

extension Chapter1View {
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
