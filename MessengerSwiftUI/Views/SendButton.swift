//
//  SendButton.swift
//  MessengerSwiftUI
//
//  Created by Andrei Harnashevich on 3.09.24.
//

import SwiftUI

struct SendButton: View {
    @Binding var text: String
    @EnvironmentObject var model: AppStateModel

    var body: some View {
        Button(action: {
            self.sendMessage()
        }, label: {
            Image(systemName: "paperplane")
                .font(.system(size: 33))
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(Circle())
        })
    }

    func sendMessage() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }

        model.sendMessage(text: text)

        text = ""
    }
}
