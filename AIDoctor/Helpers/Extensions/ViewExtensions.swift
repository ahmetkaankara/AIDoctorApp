//
//  ViewExtensions.swift
//  AiGirlfriend
//
//  Created by Ahmet Kaan Kara on 14.02.2024.
//

import Foundation
import SwiftUI
public extension View {
    func asImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let renderer = UIGraphicsImageRenderer(size: view!.bounds.size)

        let image = renderer.image { (context) in
            view!.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }

        return image
    }
    
//    func popup<PopupContent: View>(
//        isPresented: Binding<Bool>,
//        content: @escaping () -> PopupContent
//    ) -> some View {
//        self.modifier(PopupModifier(isPresented: isPresented, popupContent: content))
//    }

    @MainActor func render(scale: CGFloat) -> UIImage?{
        let renderer = ImageRenderer(content: self)
        renderer.scale = scale
        return renderer.uiImage
    }

    
    func fullBackground(imageName: String) -> some View {
       return background(
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
       )
    }
    
    func fullBackground(image: UIImage) -> some View {
       return background(
            Image(uiImage:image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
       )
    }

    func customFrame(multiplier: CGFloat) -> some View {
        self.frame(
            width: 300*multiplier,
            height: 527*multiplier
        )
    }
    
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape(RoundedCorner(radius: radius, corners: corners))
//    }
    

    
    
}



