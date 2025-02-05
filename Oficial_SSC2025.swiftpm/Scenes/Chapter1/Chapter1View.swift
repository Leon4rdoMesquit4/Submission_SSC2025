//
//  SwiftUIView.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 03/02/25.
//

import SwiftUI

struct Chapter1View: View {
    @State var chpt: Chpt1viewChoose = .menu
    
    var body: some View {
        ZStack {
            switch chpt {
            case .menu:
                menu
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
    
extension Chapter1View {
    var menu: some View {
        Chapter1MenuView {
            chpt = .part1
        }
    }
    
    var part1: some View {
        Chapter1Part1View {
            chpt = .part2
        }
    }
    
    var part2: some View {
        Chapter1Part2View {
            chpt = .part3
        }
    }
    
    var part3: some View {
        Chapter1Part3View {
            chpt = .part4
        }
    }
    
    var part4: some View {
        Text("Part 4")
    }
    
    var part5: some View {
        Text("Part 5")
    }
    
    var completed: some View {
        CompletedView(chapterNumber: .one) {
            Chapter1PaintedBackground(hasBorder: .constant(true))
        } action: {
            
        }
    }
}

enum Chpt1viewChoose {
    case menu
    case part1
    case part2
    case part3
    case part4
    case part5
    case completed
}

#Preview {
    Chapter1View()
}
