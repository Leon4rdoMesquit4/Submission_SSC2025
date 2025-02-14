//
//  Chapter3View.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 10/02/25.
//

import SwiftUI

struct Chapter3View: View {
    @State var chpt: Chpt3viewChoose = .part1
    @Binding var changeToNextChapter: Chapters
    
    var body: some View {
        ZStack {
            switch chpt {
            case .part1:
                part1
            case .part2:
                part2
            case .part3:
                part3
            case .part4:
                part4
            case .part5:
                part5
            case .completed:
                completed
            }
        }
    }
}
    
extension Chapter3View {
    var part1: some View {
        Chapter2Part1View {
            chpt = .part2
        }
    }
    
    var part2: some View {
        Chapter2Part2View {
            chpt = .part3
        }
    }
    
    var part3: some View {
        Chapter2Part3View {
            chpt = .part4
        }
    }
    
    var part4: some View {
        Chapter2Part4View {
            chpt = .part5
        }
    }
    
    var part5: some View {
        Chapter2Part5View {
            chpt = .completed
        }
    }
    
    var completed: some View {
        CompletedView(chapterNumber: .two) {
            Chapter2Background()
        } action: {
            changeToNextChapter = .one
        }
    }
}

enum Chpt3viewChoose {
    case part1
    case part2
    case part3
    case part4
    case part5
    case completed
}

#Preview {
    Chapter3View(changeToNextChapter: .constant(.two))
}
