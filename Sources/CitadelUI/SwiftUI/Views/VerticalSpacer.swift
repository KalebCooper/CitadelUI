//
//  VerticalSpacer.swift
//  
//
//  Created by Kaleb Cooper on 6/13/22.
//

import SwiftUI

public struct VerticalSpacer: View {

    @ViewBuilder
    public static var greedy: some View {
        Self(minHeight: .zero, idealHeight: .infinity, maxHeight: .infinity, alignment: .center)
    }

    public var minLength: CGFloat? = nil
    public var minHeight: CGFloat? = nil
    public var idealHeight: CGFloat? = nil
    public var maxHeight: CGFloat? = nil
    public var alignment: Alignment = .center

    public init(
        minLength: CGFloat? = nil,
        minHeight: CGFloat? = nil,
        idealHeight: CGFloat? = nil,
        maxHeight: CGFloat? = nil,
        alignment: Alignment = .center
    ) {
        self.minLength = minLength
        self.minHeight = minHeight
        self.idealHeight = idealHeight
        self.maxHeight = maxHeight
        self.alignment = alignment
    }

    public var body: some View {
        Spacer(minLength: minLength)
            .frame(minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight, alignment: alignment)
    }
}

struct VerticalSpacer_Previews: PreviewProvider {
    static var previews: some View {
        VerticalSpacer()
    }
}
