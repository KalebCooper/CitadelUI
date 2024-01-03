//
//  AlertView.swift
//  
//
//  Created by Kaleb Cooper on 9/4/22.
//

import Foundation

/// Describes where the Message View originates from
public enum AlertOrigin {
    case top
    case bottom
}
public enum AlertAnchorDirection {
    case above
    case below
}
public enum AlertDuration {
    case indefinite
    case auto
    case custom(length: Double)

    public var value: TimeInterval {
        switch self {
        case .indefinite:
            return .infinity
        case .auto:
            return 1.5
        case .custom(let length):
            return length
        }
    }
}
