//
//  InfoText.swift
//  
//
//  Created by Kaleb Cooper on 8/11/21.
//

import Foundation
import SwiftUI

public struct InfoText: View {
    let text: String
    
    public var body: some View {
        #if os(iOS)
        ios
        #elseif os(macOS)
        standard
        #elseif os(watchOS)
        standard
        #elseif os(tvOS)
        standard
        #else
        standard
        #endif
    }
    
    var ios: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .trailing], 18)
    }
    
    var standard: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init(_ text: String) {
        self.text = text
    }
}
