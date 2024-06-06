//
//  OpenAIService.swift
//  AIDoctor
//
//  Created by Ahmet Kaan Kara on 20.05.2024.
//

import Foundation
import Alamofire

class OpenAIService {
    
    private let endPointUrl = "https://api.openai.com/v1/chat/completions"
 
    func sendMessage(messages:[Message]) async -> OpenAIChatResponse?{
        let chatMessages = messages.map({OpenAIChatMessage(role: $0.role, content: $0.content)})
        let body = OpenAIChatBody(model: "gpt-3.5-turbo"
                                  , messages: chatMessages)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer -change here with openai api key-"
        ]
        return try? await AF.request(endPointUrl,method: .post,parameters: body,encoder: .json,headers: headers).serializingDecodable(OpenAIChatResponse.self).value
        
    }
}
