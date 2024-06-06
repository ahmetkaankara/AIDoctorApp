//
//  MainButtonView.swift
//  AIDoctor
//
//  Created by Ahmet Kaan Kara on 20.05.2024.
//

import SwiftUI

struct MainButtonView: View {
    let text:String
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .bold()
            .font(.title2)
            .foregroundColor(.white)
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
            }
    }
}

#Preview {
    MainButtonView(text: "Continue")
        .padding(20)
}
