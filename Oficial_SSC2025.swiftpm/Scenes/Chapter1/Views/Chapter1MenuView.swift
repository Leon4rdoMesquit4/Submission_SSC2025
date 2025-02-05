import SwiftUI

struct Chapter1MenuView: View {
    @State var isPainted: Bool = false
    let action: (() -> Void)?
    
    var body: some View {
        menu
            .ignoresSafeArea()
    }
}

extension Chapter1MenuView {
    var menu: some View {
        ZStack {
            if isPainted {
                Chapter1PaintedBackground(hasBorder: .constant(false))
            } else {
                MenuGradientBackground()
            }
            VStack {
                Spacer()
                gameTitle
                gameSubtitle
                MountFuji(isPainted: $isPainted)
            }
            if !isPainted {
                bottomButton
            }
        }
    }
    
    var gameTitle: some View {
        Image(!isPainted ? ImageConstants.gameName : ImageConstants.gameNamePainted)
    }
    
    var gameSubtitle: some View {
        Text(subtitleText)
            .font(FontsConstants.subtitle2)
            .foregroundStyle(isPainted ? ColorsConstants.chpt1color1 : ColorsConstants.chpt1white)
            .padding(.top, SpacingContants.medium)
    }
    
    var bottomButton: some View {
        CustomButton(state: .play, text: buttonText) {
            withAnimation(.smooth(duration: DurationConstants.huge)) {
                isPainted.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + DurationConstants.huge) {
                action?()
            }
        }
        .foregroundStyle(ColorsConstants.chpt1white)
    }
}

extension Chapter1MenuView {
    var subtitleText: String {
        "A tale of folding paper"
    }
    
    var buttonText: String {
        "Start Journey"
    }
}
