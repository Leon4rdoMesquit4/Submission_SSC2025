import SwiftUI

struct Chapter1View: View {
    var body: some View {
        ZStack {
            gradientBackground
            VStack {
                Spacer()
                gameTitle
                gameSubtitle
                gameImage
            }
            
            bottomButton
        }
        .ignoresSafeArea()
    }
}

extension Chapter1View {
    
    var gameTitle: some View {
        Image(ImageConstants.gameName)
    }
    
    var gameSubtitle: some View {
        Text("A tale of folding paper")
            .font(FontsConstants.subtitle2)
            .foregroundStyle(ColorsConstants.chpt1white)
    }
    
    var gameImage: some View {
        Image(ImageConstants.fujiColored)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.top, SpacingContants.extraUltraLarge)
    }
    
    var bottomButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                CustomButton(state: .play, text: "Start Journey")
                    .foregroundStyle(ColorsConstants.chpt1white)
                    .padding([.bottom, .trailing], SpacingContants.ultraLarge)
            }
        }
    }
    
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
