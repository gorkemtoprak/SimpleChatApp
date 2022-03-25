//
//  ContentView.swift
//  ChatApp
//
//  Created by GT on 24.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = MessageViewModel()
    
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                ScrollViewReader{ proxy in
                    ScrollView{
                        ForEach(model.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }.padding(.top, 15).background(Color.theme.background).cornerRadius(30, corners: [.topLeft, .topRight])
                }
            }.background(Color.theme.peach)
            MessageField().environmentObject(model)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
