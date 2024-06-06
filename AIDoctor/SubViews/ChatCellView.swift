//
//  ChatCellView.swift
//  AIDoctor
//
//  Created by Ahmet Kaan Kara on 20.05.2024.
//

import SwiftUI

struct ChatCellView: View {
    let message:Message
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }()
    var body: some View {
        HStack {
            if message.role == .user {
                Spacer()
                Text(message.content)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding(.horizontal, 10)
            } else {
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment:.top) {
                        if message.role == .assistant {
                            Image("doctor-image")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                        }
                        VStack(alignment:.leading){
                            Text(message.content)
                   

                        }
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding(.horizontal, 10)
                    }
                    Text(dateFormatter.string(from: message.createDate))
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 50)
                }
                Spacer()
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ChatCellView(message: Message(id: UUID(), role: .assistant, content: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest", createDate: Date()))
}
