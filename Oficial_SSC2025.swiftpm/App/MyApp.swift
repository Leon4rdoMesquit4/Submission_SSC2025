import SwiftUI

@main
struct MyApp: App {
    @State var currentChapter: Chapters = .one
    
    var body: some Scene {
        WindowGroup {
            switch currentChapter {
            case .one:
                Chapter1View(changeToNextChapter: $currentChapter)
            case .two:
                Chapter2View(changeToNextChapter: $currentChapter)
            case .three:
                Chapter2View(changeToNextChapter: $currentChapter)
            case .creditsScene:
                Text("Credits")
            }
        }
    }
}

enum Chapters {
    case one
    case two
    case three
    case creditsScene
}
