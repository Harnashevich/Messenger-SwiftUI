//
//  ChatView.swift
//  MessengerSwiftUI
//
//  Created by Andrei Harnashevich on 3.09.24.
//

import SwiftUI

struct CustomField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 7))
    }
}

struct ChatView: View {
    @State var message: String = ""
    @EnvironmentObject var model: AppStateModel
    let otherUsername: String
    
    init(otherUsername: String) {
        self.otherUsername = otherUsername
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ForEach(model.messages, id: \.self) { message in
                    ChatRow(
                        text: message.text,
                        type: message.type
                    )
                    .padding(3)
                }
            }
            
            // Field, send button
            
            HStack {
                TextField("Message...", text: $message)
                    .modifier(CustomField())
                
                SendButton(text: $message)
                
            }
            .padding()
        }
        .navigationTitle(otherUsername)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            model.otherUsername = otherUsername
            model.observeChat()
        }
    }
}

#Preview {
    ChatView(otherUsername: "Samantha")
}
