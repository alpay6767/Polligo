//
//  ContentView.swift
//  Polligo
//
//  Created by Alpay Kücük on 27.10.21.
//

import SwiftUI

struct ContentView: View {
    
    var logo: some View {
        
        Text(Constants.logoString)
            .font(Font.custom(Constants.fontString, size: 60, relativeTo: .title))
            .padding(.top, 50)
            .foregroundColor(.white)
    }
    
    var header: some View {
        Text(Constants.mainQuestionString)
            .font(Font.custom(Constants.fontString, size: 22))
            .foregroundColor(.white)
    }
    
    var controls: some View {
        Group {
            HomeButton(name: Constants.umfrageErstellenString, buttonColor: Constants.umfrageColorString, textColor: .white) {
                print("hi")
            }
            Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HomeButton(name: Constants.umfrageTeilnehmenString, buttonColor: Constants.teilnehmenColorString, textColor: .white) {
                print("hit")
            }
        }
        
    }
    
    var body: some View {
        
        VStack (spacing: 0) {
        ZStack (alignment: .top) {
                Color.init(Constants.colorString).ignoresSafeArea()
                VStack {
                    logo
                    Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    header
                    Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    controls
                }
            }
        ZStack (alignment: .bottom){
                Color.init(Constants.colorString).ignoresSafeArea()
            Image("homeMen").resizable().aspectRatio(contentMode: .fit).padding(.bottom).frame(width: 300, height: 400, alignment: .bottom)
        }.ignoresSafeArea()

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)

    }
}
