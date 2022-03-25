//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by GT on 25.03.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageViewModel: ObservableObject {
    
    @Published private(set) var messages: [MessageModel] = []
    let firebase = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages(){
        firebase.collection("messages").addSnapshotListener { snapshot, error in
            guard let docs = snapshot?.documents else {
                print(error)
                return
            }
            self.messages = docs.compactMap { doc -> MessageModel? in
                do{
                    return try doc.data(as: MessageModel.self)
                } catch{
                    print("Error while decoding messages \(error)")
                    return nil
                }
            }
            
            self.messages.sort {
                $0.time < $1.time
            }
        }
    }
    
    func sendMessage(message: String) {
        do {
            let newMessage = MessageModel(id: "\(UUID())", message: message, received: false, time: Date())
            
            try firebase.collection("messages").document().setData(from: newMessage)
            
        } catch {
            print("Error while adding new messages \(error)")
        }
    }
}
