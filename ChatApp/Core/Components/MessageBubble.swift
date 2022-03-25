//
//  MessageBubble.swift
//  ChatApp
//
//  Created by GT on 25.03.2022.
//

import SwiftUI

struct MessageBubble: View {
    
    var message: MessageModel
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.message).padding().background(message.received ? Color.theme.gray : Color.theme.peach).cornerRadius(25)
            }.frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
                .onTapGesture {
                    showTime.toggle()
                }
            if showTime == true {
                Text("\(message.time.formatted(.dateTime.hour().minute()))")
                    .font(.caption2).foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing , 25)
            }
            
        }.frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing).padding(message.received ? .leading : .trailing).padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: MessageModel(id: "1", message: "AAaaaaa", received: false, time: Date()))
    }
}
