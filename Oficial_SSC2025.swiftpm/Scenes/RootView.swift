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
    @State var isTipShown: Bool = true
    
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
        }.overlay {
            OrientationTipView()
                .onAppear {
                    Task {
                        await showTipAfterDelay()
                    }
                }.opacity(isTipShown ? 1 : 0)
                .blur(radius: isTipShown ? 0 : 30)
                .scaleEffect(isTipShown ? 1 : 1.1)
                .animation(.spring(duration: 2), value: isTipShown)
        }.ignoresSafeArea()
            .environmentObject(manager)
    }
}

extension RootView {
    func showTipAfterDelay() async {
        do {
            try await Task.sleep(nanoseconds: 6_000_000_000)
            isTipShown = false
        } catch {
            print("Task sleep error: \(error)")
        }
    }
}

enum Chapters {
    case one
    case two
    case three
    case creditsScene
}
