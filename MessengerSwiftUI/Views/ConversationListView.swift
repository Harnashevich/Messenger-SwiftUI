//
//  ConversationListView.swift
//  MessengerSwiftUI
//
//  Created by Andrei Harnashevich on 3.09.24.
//

import SwiftUI

struct ConversationListView: View {
    let usernames = ["Joe", "Jill", "Bob"]
    @EnvironmentObject var model: AppStateModel
    @State var otherUsername: String = ""
    @State var showChat = false
    
    var body: some View {
        NavigationView {
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
                    
                    if !otherUsername.isEmpty {
                        NavigationLink("",
                                       destination: ChatView(otherUsername: otherUsername),
                                       isActive: $showChat)
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
                            SearchView() { name in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self.otherUsername = name
                                    self.showChat = true
                                }
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $model.showingSignIn, content: {
                SingInView()
            })
        }
    }
    
    func singOut() {
        
    }
}

#Preview {
    ConversationListView()
        .environmentObject(AppStateModel())
}
