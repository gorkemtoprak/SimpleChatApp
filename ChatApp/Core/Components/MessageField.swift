//
//  MessageField.swift
//  ChatApp
//
//  Created by GT on 25.03.2022.
//

import SwiftUI

struct MessageField: View {
    
    @EnvironmentObject var model: MessageViewModel
    @State private var message: String = ""
    
    var body: some View {
        HStack{
            CustomTextField(placeholder: Text("Please Enter Your Message"), text: $message)
            Button {
                model.sendMessage(message: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill").foregroundColor(Color.theme.background).padding(10).background(Color.theme.peach).cornerRadius(50)
            }
        }.padding(.horizontal).padding(.vertical, 10).background(Color.theme.gray).cornerRadius(50).padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField().environmentObject(MessageViewModel())
    }
}

struct CustomTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder.opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
