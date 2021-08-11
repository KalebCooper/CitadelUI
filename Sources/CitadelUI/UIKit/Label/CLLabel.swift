//
//  CLLabel.swift
//  slym-ios
//
//  Created by Kaleb Cooper on 7/18/20.
//  Copyright © 2020 Cooper Labs LLC. All rights reserved.
//

#if os(iOS)
import UIKit

public enum CLLabelIconPosition {
    case left
    case right
}
public class CLLabel: UILabel {
    
    // MARK: Public Properties
    
    // MARK: Private Properties
    
    // MARK: Views
    
    //----------
    // MARK: - Initializer
    //----------
    required init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    override public init(frame: CGRect) { super.init(frame: frame) }
    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) { }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //----------
    // MARK: - Setup Code
    //----------
    private func setupView() {
    }
    
}
#endif
