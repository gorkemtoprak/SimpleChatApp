//
//  TitleRow.swift
//  ChatApp
//
//  Created by GT on 25.03.2022.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80")
    var name = "Helena Mining"
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50).cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name).font(.title).bold()
                Text("Online").font(.caption).foregroundColor(.gray)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }.padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow().background(Color.theme.peach)
    }
}
