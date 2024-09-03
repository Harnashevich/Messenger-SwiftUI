//
//  ChatView.swift
//  MessengerSwiftUI
//
//  Created by Andrei Harnashevich on 3.09.24.
//

import SwiftUI

struct ChatView: View {
    @State var message: String = ""
    let otherUsername: String
    
    init(otherUsername: String) {
        self.otherUsername = otherUsername
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ChatRow(text: "Hello world", type: .sent)
                    .padding(3)
                ChatRow(text: "Hello world", type: .received)
                    .padding(3)
            }
            
            // Field, send button
            
            HStack {
                TextField("Message...", text: $message)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                
                SendButton(text: $message)
                
            }
            .padding()
        }
        .navigationTitle(otherUsername)
    }
}

#Preview {
    ChatView(otherUsername: "Samantha")
}
