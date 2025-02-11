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
                Chapter2View()
            case .three:
                Chapter2View()
            }
            
        }
    }
}

enum Chapters {
    case one
    case two
    case three
}
