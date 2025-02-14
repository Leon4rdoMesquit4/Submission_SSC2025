//
//  RestartView.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 05/02/25.
//

import SwiftUI

struct RestartView: View {
    var action: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .center){
            Chapter3Background()
            VStack(alignment: .leading) {
                Spacer()
                Text("Credits")
                    .foregroundStyle(ColorsConstants.chpt3color)
                Text("Leonardo Mesquita Alves")
                    .font(FontsConstants.mainTitle)
                    .foregroundStyle(ColorsConstants.chpt3color)
                Spacer()
            }
            CustomButton(state: .restart, text: "Restart Journey") {
                action?()
            }.foregroundStyle(ColorsConstants.chpt3color)
        }.ignoresSafeArea()
    }
}

#Preview {
    RestartView()
}
