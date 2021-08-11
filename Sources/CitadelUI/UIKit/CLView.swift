//
//  UIView+Mode.swift
//  slym-ios
//
//  Created by Kaleb Cooper on 7/2/20.
//  Copyright © 2020 Cooper Labs LLC. All rights reserved.
//

#if os(iOS)
import UIKit

public protocol ViewConfigurable {
    
}
public enum ViewConfigureType {
    case setup
    case update
}
public enum ViewState {
    case empty
    case loading
    case done
}
protocol CLViewStateDelegate: AnyObject {
    func view(updatedTo state: ViewState)
}

/// Convenience `UIView` subclass that provides extended functionality to speed up development.
public class CLView: UIView {
    
    weak var stateDelegate: CLViewStateDelegate?
    
    //----------------------------------------------------------------
    // MARK: - Convenience Values
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK: - UI Constraint Convenience
    //----------------------------------------------------------------
    
    // MARK: Safe Area
    
    ///Convenience shorthand for `safeAreaLayoutGuide.topAnchor`
    private(set) lazy var topSafe: NSLayoutYAxisAnchor = {
        return safeAreaLayoutGuide.topAnchor
    }()
    ///Convenience shorthand for `safeAreaLayoutGuide.leftAnchor`
    private(set) lazy var leftSafe: NSLayoutXAxisAnchor = {
        return safeAreaLayoutGuide.leftAnchor
    }()
    ///Convenience shorthand for `safeAreaLayoutGuide.rightAnchor`
    private(set) lazy var rightSafe: NSLayoutXAxisAnchor = {
        return safeAreaLayoutGuide.rightAnchor
    }()
    ///Convenience shorthand for `safeAreaLayoutGuide.leadingAnchor`
    private(set) lazy var leadingSafe: NSLayoutXAxisAnchor = {
        return safeAreaLayoutGuide.leadingAnchor
    }()
    ///Convenience shorthand for `safeAreaLayoutGuide.trailingAnchor`
    private(set) lazy var trailingSafe: NSLayoutXAxisAnchor = {
        return safeAreaLayoutGuide.trailingAnchor
    }()
    ///Convenience shorthand for `safeAreaLayoutGuide.bottomAnchor`
    private(set) lazy var bottomSafe: NSLayoutYAxisAnchor = {
        return safeAreaLayoutGuide.bottomAnchor
    }()
    ///Convenience shorthand for `safeAreaLayoutGuide.centerXAnchor`
    private(set) lazy var centerXSafe: NSLayoutXAxisAnchor = {
        return safeAreaLayoutGuide.centerXAnchor
    }()
    ///Convenience shorthand for `safeAreaLayoutGuide.centerYAnchor`
    private(set) lazy var centerYSafe: NSLayoutYAxisAnchor = {
        return safeAreaLayoutGuide.centerYAnchor
    }()
    
    var state: ViewState! {
        didSet {
            stateDelegate?.view(updatedTo: state)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
#endif
