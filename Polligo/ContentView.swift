//
//  ContentView.swift
//  Polligo
//
//  Created by Alpay Kücük on 27.10.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var orientation = UIDeviceOrientation.unknown

    @State private var action: Int? = 0

    init() {
            UINavigationBar.changeAppearance(clear: true)
        }
    
    var logo: some View {
        
        Text(Constants.logoString)
            .font(Font.custom(Constants.fontString, size: 60, relativeTo: .title))
            .padding(.top, 0)
            .foregroundColor(.white)
    }
    
    var header: some View {
        Text(Constants.mainQuestionString)
            .font(Font.custom(Constants.fontString, size: 22))
            .foregroundColor(.white)
    }
    
    var controls: some View {
        
        Group {
            //MARK: NavigationLinks für die Navigation zu verschiedenen Views:
            NavigationLink(destination: UmfrageErstellenView(), tag: 1, selection: $action) {
            }
            
            //MARK: Die Buttons und deren Actions in unserem Homescreen:
            HomeButton(name: Constants.umfrageErstellenString, buttonColor: Constants.umfrageColorString, textColor: .white) {
                self.action = 1
            }
            Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HomeButton(name: Constants.umfrageTeilnehmenString, buttonColor: Constants.teilnehmenColorString, textColor: .white) {
                print("hit")
            }
        }
        
    }
    
    var PortraitView: some View {
        ZStack {
            Color.init(Constants.colorString).ignoresSafeArea()
            VStack (spacing: 0) {
                ZStack (alignment: .top) {
                    Color.init(Constants.colorString).ignoresSafeArea()
                    VStack {
                        logo
                        Spacer().frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        header
                        Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        controls
                    }
                }
                ZStack {
                    Color.init(Constants.colorString).ignoresSafeArea()
                    Image("homeMen").resizable().aspectRatio(contentMode: .fit).padding(.bottom).frame(width: 300, height: 400, alignment: .bottom)
                }.ignoresSafeArea()
            }
            
        }
    }
    
    var LandscapeView: some View {
        ZStack {
            Color.init(Constants.colorString).ignoresSafeArea()
            VStack (spacing: 0) {
                ZStack (alignment: .top) {
                    Color.init(Constants.colorString).ignoresSafeArea()
                    VStack {
                        logo
                        Spacer().frame(width: 100, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        header
                        Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        controls
                    }
                }
                
            }
            
        }
    }
    
    var DefaultView: some View {
        ZStack {
            Color.init(Constants.colorString).ignoresSafeArea()
            VStack (spacing: 0) {
                ZStack (alignment: .top) {
                    Color.init(Constants.colorString).ignoresSafeArea()
                    VStack {
                        logo
                        Spacer().frame(width: 100, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        header
                        Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        controls
                    }
                }
                ZStack {
                    Color.init(Constants.colorString).ignoresSafeArea()
                    Image("homeMen").resizable().aspectRatio(contentMode: .fit).padding(.bottom).frame(width: 300, height: 400, alignment: .bottom)
                }.ignoresSafeArea()
            }
            
        }
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                Group {
                    if orientation.isPortrait {
                        //MARK: Device in Portrait Mode:
                        PortraitView
                    } else if orientation.isLandscape {
                        //MARK: Device in Landscape Mode:
                        LandscapeView
                    } else if orientation.isFlat {
                        Text("Flat")
                    } else {
                        //MARK: Device in Default Mode:
                        DefaultView
                        }
                }
                .onRotate { newOrientation in
                orientation = newOrientation
            }
        }
    }
    .accentColor( .white)
    .navigationViewStyle(StackNavigationViewStyle())
    }
}

// Our custom view modifier to track rotation and
// call our action
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)

    }
}


extension UINavigationBar {
    static func changeAppearance(clear: Bool) {
        let appearance = UINavigationBarAppearance()
        
        if clear {
            appearance.configureWithTransparentBackground()
        } else {
            appearance.configureWithDefaultBackground()
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
