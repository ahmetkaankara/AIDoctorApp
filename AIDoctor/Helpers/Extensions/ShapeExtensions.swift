//
//  ShapeExtensions.swift
//  AIDoctor
//
//  Created by Ahmet Kaan Kara on 20.05.2024.
//

import Foundation
import SwiftUI

extension Shape {
    func style<S: ShapeStyle, F: ShapeStyle>(
        withStroke strokeContent: S,
        lineWidth: CGFloat = 1,
        fill fillContent: F
    ) -> some View {
        self.stroke(strokeContent, lineWidth: lineWidth)
    .background(fill(fillContent))
    }
}
