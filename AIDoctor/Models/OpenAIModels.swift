//
//  OpenAIModels.swift
//  AiGirlfriend
//
//  Created by Ahmet Kaan Kara on 11.02.2024.
//

import Foundation


//For Encode
struct OpenAIChatBody:Encodable{
    let model:String
    let messages: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Codable{
    let role:Role
    let content:String
}

//enum for role

enum Role:String,Codable{
    case system
    case user
    case assistant
}

//For Response

struct OpenAIChatResponse:Decodable{
    let choices:[Choices]
}

struct Choices:Decodable{
    let message:OpenAIChatMessage
}

struct Message:Encodable,Decodable {
    
    let id: UUID
    let role:Role
    let content: String
    let createDate: Date
    var imageURL:String?
    
}
