//
//  FrageHinzufuegenButton.swift
//  Polligo
//
//  Created by Alpay Kücük on 28.10.21.
//

import SwiftUI

struct FrageHinzufuegenButton: View {
    
    var name: String
    var buttonColor: String
    var textColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                Rectangle().frame(width: 240, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(30)
                    .foregroundColor(Color.init(buttonColor))
                Text(name).foregroundColor(textColor)
                    .font(Font.custom(Constants.fontString, size: 20))
            }
        })
    }
}
