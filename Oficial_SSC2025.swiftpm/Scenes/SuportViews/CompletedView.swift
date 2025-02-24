//
//  CompletedView.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 05/02/25.
//

import SwiftUI

struct CompletedView<Content: View>: View {
    var chapterNumber: ChapterNumber = .one
    @ViewBuilder var content: () -> Content
    var action: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .center){
            content()
            VStack {
                Text(title)
                    .font(FontsConstants.mainTitle)
                Text(subtitle)
                    .font(FontsConstants.subtitle)
            }.chapterColor(chapterNumber)
            CustomButton(state: .play, text: nextChapter) {
                action?()
            }.chapterColor(chapterNumber)
        }.ignoresSafeArea()
    }
}

extension CompletedView {
    var nextChapter: String {
        "Next Chapter"
    }
    var title: String {
        chapterNumber == .three ? "The end!" : "Completed"
    }
    var subtitle: String {
        "Chapter \(chapterNumber.rawValue)/3"
    }
}

enum ChapterNumber: Int {
    case one = 1
    case two = 2
    case three = 3
}

struct ChapterColorModifier: ViewModifier {
    var chapterNumber: ChapterNumber
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(colorForChapter(chapterNumber))
    }
    
    private func colorForChapter(_ chapter: ChapterNumber) -> Color {
        switch chapter {
        case .one:
            return ColorsConstants.chpt1color1
        case .two:
            return ColorsConstants.chpt2color
        case .three:
            return ColorsConstants.chpt3color
        }
    }
}

private extension View {
    func chapterColor(_ chapterNumber: ChapterNumber) -> some View {
        self.modifier(ChapterColorModifier(chapterNumber: chapterNumber))
    }
}

#Preview {
    CompletedView(chapterNumber: .three) {
        Chapter1PaintedBackground(hasBorder: .constant(true))
    }
}
