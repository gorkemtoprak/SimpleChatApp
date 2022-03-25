//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by GT on 24.03.2022.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
