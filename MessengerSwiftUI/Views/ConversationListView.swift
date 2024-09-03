//
//  ConversationListView.swift
//  MessengerSwiftUI
//
//  Created by Andrei Harnashevich on 3.09.24.
//

import SwiftUI

struct ConversationListView: View {
    let usernames = ["Joe", "Jill", "Bob"]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(usernames, id: \.self) { name in
                    NavigationLink {
                        ChatView(otherUsername: name)
                    } label: {
                        HStack {
                            Circle()
                                .frame(width: 65, height: 65)
                                .foregroundStyle(Color.pink)
                            
                            Text(name)
                                .bold()
                                .foregroundStyle(Color(.label))
                                .font(.system(size: 32))
                            
                            Spacer()
                        }
                        .padding()
                    }
                }
                .navigationTitle("Conversation")
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.topBarLeading) {
                        Button("Sing Out") {
                            singOut()
                        }
                    }
                    
                    ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                        NavigationLink {
                            SearchView()
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
            }
        }
    }
    
    func singOut() {
        
    }
}

#Preview {
    ConversationListView()
}
