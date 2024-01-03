//
//  View+EndEditing.swift
//  
//
//  Created by Kaleb Cooper on 6/19/22.
//

import Foundation
import SwiftUI

public extension View {
    func endEditing() {
        hideKeyboard()
    }

    private func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
