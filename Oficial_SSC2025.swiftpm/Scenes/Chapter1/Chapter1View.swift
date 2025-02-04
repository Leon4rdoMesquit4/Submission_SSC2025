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
        ZStack{
            switch chpt {
            case .menu:
                Chapter1MenuView(chpt: $chpt)
            case .part1:
                Chapter1Part1View()
            case .part2:
                Text("Tchau")
            }
        }
    }
}

#Preview {
    Chapter1View()
}

enum Chpt1viewChoose {
    case menu
    case part1
    case part2
}
