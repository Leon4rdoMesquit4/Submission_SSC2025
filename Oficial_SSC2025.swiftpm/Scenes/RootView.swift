//
//  SwiftUIView.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 14/02/25.
//

import SwiftUI

struct RootView: View {
    @State var currentChapter: Chapters = .one
    @StateObject private var manager = AudioManager()
    
    var body: some View {
        ZStack {
            switch currentChapter {
            case .one:
                Chapter1View(changeToNextChapter: $currentChapter)
            case .two:
                Chapter2View(changeToNextChapter: $currentChapter)
            case .three:
                Chapter3View(changeToNextChapter: $currentChapter)
            case .creditsScene:
                RestartView {
                    currentChapter = .one
                }
            }
        }.environmentObject(manager)
    }
}

enum Chapters {
    case one
    case two
    case three
    case creditsScene
}

//#Preview {
//    RootView()
//}
