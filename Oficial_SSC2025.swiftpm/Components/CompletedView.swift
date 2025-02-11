//
//  SwiftUIView.swift
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
            }
            CustomButton(state: .play, text: nextChapter) {
                action?()
            }.foregroundStyle(ColorsConstants.chpt1color1)
        }.ignoresSafeArea()
    }
}

extension CompletedView {
    var nextChapter: String {
        "Next Chapter"
    }
    var title: String {
        "Completed"
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


#Preview {
    CompletedView(chapterNumber: .three) {
        Chapter1PaintedBackground(hasBorder: .constant(true))
    }
}
