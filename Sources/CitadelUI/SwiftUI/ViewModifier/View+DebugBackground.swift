//
//  View+DebugBackground.swift
//  
//
//  Created by Kaleb Cooper on 7/5/22.
//

import Foundation
import SwiftUI

public struct DebugBackgroundModifier: ViewModifier {
    public var selectedColor: Color

    public func body(content: Content) -> some View {
        content
            .background {
                selectedColor
                    .opacity(0.15)
            }
    }
}

public extension View {
    func debugBackground(_ color: Color? = nil) -> some View {
        let colorOptions: [Color] = [.red, .blue, .mint, .indigo, .orange, .green]
        let selectedColor = color ?? colorOptions.randomElement() ?? .red
        return modifier(DebugBackgroundModifier(selectedColor: selectedColor))
    }
}
