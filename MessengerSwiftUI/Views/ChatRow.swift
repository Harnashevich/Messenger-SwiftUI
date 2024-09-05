//
//  ChatRow.swift
//  MessengerSwiftUI
//
//  Created by Andrei Harnashevich on 3.09.24.
//

import SwiftUI

struct ChatRow: View {
    let type: MessageType
    let text: String
    @EnvironmentObject var model: AppStateModel
    
    var isSender: Bool {
        type == .sent
    }
    
    init(
        text: String,
        type: MessageType
    ) {
        self.text = text
        self.type = type
    }
    
    var body: some View {
        HStack() {
            if isSender { Spacer() }
            
            if !isSender {
                VStack {
                    Spacer()
                    Image(model.currentUsername == "andrei" ? "photo1" : "photo2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color.pink)
                        .clipShape(Circle())
                }
            }
            HStack {
                Text(text)
                    .foregroundStyle(isSender ? Color.white : Color(.label))
                    .padding()
            }
            .background(isSender ? Color.blue : Color(.systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(
                isSender ? .leading : .trailing,
                isSender ?  UIScreen.main.bounds.width / 3 : UIScreen.main.bounds.width / 5
               
            )
            
            if !isSender { Spacer() }
        }
    }
}

#Preview {
    Group {
//        ChatRow(type: .sent)
//            .preferredColorScheme(.dark)
        ChatRow(text: "Hello Test Data", type: .received)
            .preferredColorScheme(.light)
    }
}
