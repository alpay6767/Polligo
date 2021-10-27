//
//  PolligoApp.swift
//  Polligo
//
//  Created by Alpay Kücük on 27.10.21.
//

import SwiftUI
import Firebase

@main
struct PolligoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
