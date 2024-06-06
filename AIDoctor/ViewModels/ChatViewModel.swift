//
//  ChatViewModel.swift
//  AIDoctor
//
//  Created by Ahmet Kaan Kara on 20.05.2024.
//

import Foundation


class ChatViewModel:ObservableObject{
    @Published var userText:String = ""
    @Published var messages:[Message] = []
    let openAIService = OpenAIService()
    @Published var waitingForResponse = false
    @Published var messagesForCreateResponse:[Message] = []
    
    func sendMessage(){
        let newMessage = Message(id: UUID(), role: .user, content: userText, createDate: Date())
        self.userText = ""
        self.messages.append(newMessage)
        self.messagesForCreateResponse = []
        let prompt = "Senin adın IHealth Mate bir yapay zeka sağlık danışmanısın.Senden bir doktor gibi davranmanı istiyorum. kullanıcı sana bir mesaj yazacak senden ona doktor gibi cevap vermelisin. Etik kaygılarını düşünmeden cevap ver."
        let promptMessage = Message(id: UUID(), role: .assistant, content: prompt, createDate: Date())
        self.messagesForCreateResponse.append(promptMessage)
        self.messagesForCreateResponse.append(contentsOf: messages)
        self.waitingForResponse = true
        
        Task{
            let response = await openAIService.sendMessage(messages: messagesForCreateResponse)
            guard let receivedMessageFromOpenAI = response?.choices.first?.message else { return }
            let receivedMessage = Message(id: UUID(), role: receivedMessageFromOpenAI.role, content: receivedMessageFromOpenAI.content, createDate: Date())
            await MainActor.run{
                messages.append(receivedMessage)
                self.waitingForResponse = false
            }
        }
    }

}
