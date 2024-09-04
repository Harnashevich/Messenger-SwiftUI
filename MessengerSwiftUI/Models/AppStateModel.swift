//
//  AppStateModel.swift
//  MessengerSwiftUI
//
//  Created by Andrei Harnashevich on 3.09.24.
//

import SwiftUI

class AppStateModel: ObservableObject {
    @AppStorage("currentUsername") var currentUsername: String = ""
    @AppStorage("currentEmail") var currentEmail: String = ""
    
    @Published var showingSignIn: Bool = true
    @Published var conversations: [String] = []
    @Published var messages: [Message] = []
    
    var otherUsername = ""
}

// Search

extension AppStateModel {
    
    func searchUsers(queryText: String, completion: @escaping ([String]) -> Void) {
        
    }
    
    func createConversation() {
    }
}

// Conversations

extension AppStateModel {
    
    func getConversations() {
    }
}

// Get Chat / Send Messages

extension AppStateModel {
    
    func observeChat() {
    }
    
    func sendMessage(text: String) {
    }
}

// Sign In & Sing Up

extension AppStateModel {
    
    func signIn(username: String, password: String) {
        
    }
    
    func signUp(email: String, username: String, password: String) {
    }
    
    func signOut() {
    }
}
