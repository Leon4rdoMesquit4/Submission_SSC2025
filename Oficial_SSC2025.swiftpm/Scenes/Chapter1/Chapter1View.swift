//
//  SwiftUIView.swift
//  Oficial_SSC2025
//
//  Created by Leonardo Mesquita Alves on 03/02/25.
//

import SwiftUI

struct Chapter1View: View {
    @State var chpt: Chpt1viewChoose = .menu
    @Namespace private var mountFujiAnimation
    
    var body: some View {
        ZStack {
            switch chpt {
            case .menu:
                Chapter1MenuView {
                    chpt = .part1
                }
            case .part1:
                Chapter1Part1View {
                    chpt = .part2
                }
            case .part2:
                Chapter1Part2View {
                    withAnimation(.smooth(duration: DurationConstants.huge)) {
                        chpt = .part3
                    }
                }
            case .part3:
                Text("Part 3")
            }
        }.background(ColorsConstants.chpt1bgcolor)
    }
}

#Preview {
    Chapter1View()
}

enum Chpt1viewChoose {
    case menu
    case part1
    case part2
    case part3
}
