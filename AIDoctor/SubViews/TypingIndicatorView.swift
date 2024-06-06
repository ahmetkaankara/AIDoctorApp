//
//  TypingIndicatorView.swift
//  AIDoctor
//
//  Created by Ahmet Kaan Kara on 20.05.2024.
//
import SwiftUI
import Foundation
struct TypingIndicatorView: View {

    @State private var numberOfDots = 3
    let speed: Double = 0.3
    
    var body: some View {
        
        HStack(alignment:.top) {
                Image("doctor-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            
            HStack(alignment: .firstTextBaseline) {
                Text("Typing")
                    
                ForEach(0..<3) { i in
                    Circle()
                        .opacity((self.numberOfDots == i) ? 1 : 0)
                        .foregroundColor(.white)
                        .frame(width:3,height: 3)
                }
            }
            .foregroundColor(.white)
            .animation(Animation.spring(response: 0.5,dampingFraction: 0.7,blendDuration: 0.1).speed(2), value: 2)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: self.speed, repeats: true) { _ in
                    var randomNumb: Int
                    repeat {
                        randomNumb = Int.random(in: 0...2)
                    } while randomNumb == self.numberOfDots
                    self.numberOfDots = randomNumb
                }
            }
            .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding(.horizontal, 10)
            
            Spacer()
        }


    }
    
}
