//
//  Chapter2View.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 10/02/25.
//

import SwiftUI

struct Chapter2View: View {
    @State var chpt: Chpt2SelectedPart = .part1
    @Binding var changeToNextChapter: Chapters
    @EnvironmentObject var audioManager: AudioManager
    
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
        }.onAppear {
            audioManager.playSound(sound: .chapter2and3)
        }
    }
}
    
extension Chapter2View {
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
            changeToNextChapter = .three
        }
    }
}

enum Chpt2SelectedPart {
    case part1
    case part2
    case part3
    case part4
    case part5
    case completed
}

#Preview {
    Chapter2View(changeToNextChapter: .constant(.two))
}
