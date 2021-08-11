//
//  CLTitleLabel.swift
//  slym-ios
//
//  Created by Kaleb Cooper on 7/25/20.
//  Copyright © 2020 Cooper Labs LLC. All rights reserved.
//

//import UIKit
//
//public class CLIconLabel: CLView {
//
//    // MARK: Public API
//    public var iconSymbol: SFSymbolName? {
//        didSet {
//            if iconSymbol != nil {
//                resetViews()
//            }
//        }
//    }
//    public var iconPosition: CLLabelIconPosition = .right {
//        didSet {
//            resetViews()
//        }
//    }
//    public var iconColor: UIColor = .systemPink {
//        didSet {
//            iconView.tintColor = iconColor
//            resetViews()
//        }
//    }
//    public var iconSpacing: CGFloat = 4 {
//        didSet {
//            resetViews()
//        }
//    }
//
//    public var contentAlignment: CLLabelIconPosition = .left {
//           didSet {
//               resetViews()
//           }
//       }
//
//    public var actionsEnabled: Bool = true {
//        didSet {
//            //Set user interaction bool
//            isUserInteractionEnabled = actionsEnabled
//            label.isUserInteractionEnabled = actionsEnabled
//            iconView.isUserInteractionEnabled = actionsEnabled
//
//            //Set to default
//            if actionsEnabled == true {
//
//                iconView.tintColor = iconColor
//                resetViews()
//
//            //Set icon color to disabled color and disable interaction
//            } else {
//                let disabledColor = iconColor.withAlphaComponent(0.3)
//                iconView.tintColor = disabledColor
//                resetViews()
//            }
//        }
//    }
//
//    public var font: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular) {
//        didSet {
//            label.font = font
//            if let iconSymbol = self.iconSymbol {
//                iconView.image = SFSymbol.getSymbol(withName: iconSymbol, font: font)
//            }
//        }
//    }
//
//    public var iconTapHandler: (() -> Void)?
//
//    // MARK: Private Properties
//    private let hapticsManager = HapticsManager.shared
//
//    // MARK: Views
//
//    public lazy var label: CLLabel = {
//        let label = CLLabel()
//        label.isUserInteractionEnabled = true
//        label.font = font
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
//        if #available(iOS 13.4, *) {
//            gesture.buttonMaskRequired = .primary
//        }
//        label.addGestureRecognizer(gesture)
//        label.textColor = self.iconColor
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    public lazy var iconView: CLImageView = {
//        let view = CLImageView()
//        view.backgroundColor = .clear
//        view.tintColor = self.iconColor
//        view.contentMode = .scaleAspectFit
//
//        view.isUserInteractionEnabled = true
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
//        if #available(iOS 13.4, *) {
//            gesture.buttonMaskRequired = .primary
//        }
//        view.addGestureRecognizer(gesture)
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    @objc private func onTap(_ gesture: UIGestureRecognizer) {
//        if gesture.state == .ended {
//            if let iconTapHandler = self.iconTapHandler {
//                hapticsManager.generate(type: .tap, priority: .normal)
//
//                iconTapHandler()
//            }
//        }
//    }
//
//    //----------
//    // MARK: - Initializer
//    //----------
//    required init() {
//        super.init(frame: CGRect.zero)
//        setupView()
//    }
//    override public init(frame: CGRect) { super.init(frame: frame) }
//    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
//
//    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) { }
//
//    open override func layoutSubviews() {
//        super.layoutSubviews()
//    }
//
//    //----------
//    // MARK: - Setup Code
//    //----------
//    private func setupView() {
//        isUserInteractionEnabled = true
//        setupConstraints()
//    }
//
//    private func resetViews() {
//        label.removeFromSuperview()
//        iconView.removeFromSuperview()
//
//        setupConstraints()
//    }
//
//    private func setupConstraints() {
//        addSubview(label)
//        label.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
//
//        if let symbol = self.iconSymbol {
//            iconView.image = SFSymbol.getSymbol(withName: symbol, font: self.label.font)
//            addSubview(iconView)
//
//            iconView.widthAnchor.constraint(lessThanOrEqualTo: iconView.heightAnchor, multiplier: 1.25).isActive = true
//            iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor).isActive = true
//            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//            iconView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
//
//            switch iconPosition {
//            case .left:
//
//                switch contentAlignment {
//                case .left:
//                    iconView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
//                    label.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: iconSpacing).isActive = true
//                    label.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
//                case .right:
//                    iconView.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 0).isActive = true
//                    label.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: iconSpacing).isActive = true
//                    label.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
//                }
//
//            case .right:
//
//                switch contentAlignment {
//                case .left:
//                    label.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
//                    iconView.leftAnchor.constraint(equalTo: label.rightAnchor, constant: iconSpacing).isActive = true
//                    iconView.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: 0).isActive = true
//                case .right:
//                    label.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 0).isActive = true
//                    iconView.leftAnchor.constraint(equalTo: label.rightAnchor, constant: iconSpacing).isActive = true
////                    iconView.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: 0).isActive = true
//                    iconView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
//                }
//            }
//        } else {
//            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
//            label.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
//        }
//    }
//}
//
////----------------------------------------------------------------
//// MARK: - Override touches
////----------------------------------------------------------------
//extension CLIconLabel {
//    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        if self.iconTapHandler != nil {
//            DispatchQueue.main.async {
//                self.alpha = 1.0
//                UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
//                    self.alpha = 0.5
//                }, completion: nil)
//            }
//        }
//
//    }
//
//    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if self.iconTapHandler != nil {
//            DispatchQueue.main.async {
//                self.alpha = 0.5
//                UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
//                    self.alpha = 1.0
//                }, completion: nil)
//            }
//        }
//    }
//
//    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if self.iconTapHandler != nil {
//            DispatchQueue.main.async {
//                self.alpha = 0.5
//                UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
//                    self.alpha = 1.0
//                }, completion: nil)
//            }
//        }
//    }
//}
