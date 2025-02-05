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
                Text("Completed")
                    .font(FontsConstants.mainTitle)
                Text("Chapter \(chapterNumber.rawValue)/3")
                    .font(FontsConstants.subtitle)
            }
            CustomButton(state: .play, text: "Next Chapter") {
                action?()
            }.foregroundStyle(ColorsConstants.chpt1color1)
        }.ignoresSafeArea()
    }
}

#Preview {
    CompletedView(chapterNumber: .three) {
        Chapter1PaintedBackground(hasBorder: .constant(true))
    }
}

enum ChapterNumber: Int {
    case one = 1
    case two = 2
    case three = 3
}
