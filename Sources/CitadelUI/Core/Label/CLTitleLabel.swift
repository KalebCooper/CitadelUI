//
//  CLTitleLabel.swift
//  slym-ios
//
//  Created by Kaleb Cooper on 7/25/20.
//  Copyright © 2020 SwiftKickMobile. All rights reserved.
//

import UIKit

public class CLIconLabel: CLView {
    
    // MARK: Public Properties
    public var iconSymbol: SFSymbolName? {
        didSet {
            if iconSymbol != nil {
                resetViews()
            }
        }
    }
    public var iconPosition: CLLabelIconPosition = .right {
        didSet {
            resetViews()
        }
    }
    public var iconTintColor: UIColor = .systemPink {
        didSet {
            iconView.tintColor = iconTintColor
            resetViews()
        }
    }
    
    // MARK: Private Properties
    
    // MARK: Views
    
    public lazy var label: CLLabel = {
        let label = CLLabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var iconView: CLImageView = {
        let view = CLImageView()
        view.backgroundColor = .clear
        view.tintColor = self.iconTintColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        
        setupConstraints()
    }
    
    private func resetViews() {
        label.removeFromSuperview()
        iconView.removeFromSuperview()
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        if let symbol = self.iconSymbol {
            iconView.image = SFSymbol.getSymbol(withName: symbol, font: self.label.font)
            addSubview(iconView)
            
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 1.0).isActive = true
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
            
            switch iconPosition {
            case .left:
                iconView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
                label.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
                label.rightAnchor.constraint(greaterThanOrEqualTo: rightAnchor, constant: 0).isActive = true
                
            case .right:
                label.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
                iconView.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 8).isActive = true
                iconView.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: 0).isActive = true
                
            }
        } else {
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        }
    }
}
