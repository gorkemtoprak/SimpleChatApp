//
//  MessageModel.swift
//  ChatApp
//
//  Created by GT on 25.03.2022.
//

import Foundation

struct MessageModel: Identifiable, Codable {
    var id: String
    var message: String
    var received: Bool
    var time: Date
}
