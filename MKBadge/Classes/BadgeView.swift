//
//  BadgeView.swift
//  MKBadge
//
//  Created by xiaobin liu on 2019/2/13.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit
import Foundation


/// MARK - 角标View
open class BadgeView: UILabel {
    
    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let superview = superview {
            return superview
        } else {
            return super.hitTest(point, with: event)
        }
    }
}

private var badgeKey: Void?

// MARK: - 扩展Badge角标
public extension UIView {
    
    var badge: Badge {
        get {
            let badge: Badge
            if let value = objc_getAssociatedObject(self, &badgeKey) as? Badge {
                badge = value
            } else {
                badge = Badge(self)
                objc_setAssociatedObject(self, &badgeKey, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return badge
        }
    }
}


/// MARK - Badge
public class Badge {
    
    public var type: BadgeType = .none {
        didSet {
            switch type {
            case .none, .point:
                badgeView.text = nil
                badgeView.attributedText = nil
            case .count(let count):
                badgeView.isHidden = count == 0
                let string: String
                if count > maxNumber {
                    string = "\(maxNumber)+"
                } else {
                    string = "\(count)"
                }
                badgeView.attributedText = nil
                badgeView.text = string
            case .custom(let result):
                badgeView.isHidden = result.count == 0
                badgeView.attributedText = nil
                badgeView.text = result
            case let .customRichText(attributedString, height, _):
                badgeView.isHidden = false
                badgeView.backgroundColor = .clear
                badgeView.numberOfLines = 0
                if let height = height {
                    self.height = height
                }
                badgeView.text = nil
                badgeView.attributedText = attributedString
            }
            remakeConstraints()
        }
    }
    
    
    /// 角标位置类型
    public var positionType: BadgePositionType = .topRight {
        didSet {
            remakeConstraints()
        }
    }
    
    /// 默认最大数量
    public var maxNumber: Int = 99
    
    
    /// 字体大小
    public var fontSize: CGFloat = 13 {
        didSet {
            if case .count = type {
                updateFont()
            }
        }
    }
    
    /// 角标的高度，角标的角半径是这个值的一半
    public var height: CGFloat = 9 {
        didSet {
            updateHeight()
        }
    }
    
    /// 角标背景颜色
    public var backgroundColor: UIColor = UIColor.red {
        didSet {
            badgeView.backgroundColor = backgroundColor
        }
    }
    
    /// 角标文本颜色
    public var textColor: UIColor = UIColor.white {
        didSet {
            badgeView.textColor = textColor
        }
    }
    
    private let badgeView: BadgeView
    
    private var centerXConstraint: NSLayoutConstraint?
    private var centerYConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?
    
    internal init(_ superView: UIView) {
        badgeView = BadgeView()
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.backgroundColor = .red
        badgeView.layer.masksToBounds = true
        badgeView.numberOfLines = 1
        badgeView.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        badgeView.textColor = .white
        badgeView.textAlignment = .center
        superView.addSubview(badgeView)
    }
    
    private func remakeConstraints() {
        guard let _ = badgeView.superview else {
            return
        }
        updateConstraint()
        updateHeightConstraint()
        updateWidthConstraint()
        updateCornerRadius()
    }
    
    private func updateFont() {
        badgeView.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
    }
    
    private func updateHeight() {
        updateHeightConstraint()
        updateWidthConstraint()
        updateCornerRadius()
    }
    
    private func updateConstraint() {
        guard let superView = badgeView.superview else {
            return
        }
        
        switch positionType {
        case .topLeft:
            centerXConstraint?.isActive = false
            centerXConstraint = badgeView.trailingAnchor.constraint(equalTo: superView.leadingAnchor, constant: superView.layer.cornerRadius/2)
            centerXConstraint?.isActive = true
            
            centerYConstraint?.isActive = false
            centerYConstraint = badgeView.bottomAnchor.constraint(equalTo: superView.topAnchor, constant: superView.layer.cornerRadius/4)
            centerYConstraint?.isActive = true
        case .topRight:
            
            centerXConstraint?.isActive = false
            centerXConstraint = badgeView.leadingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -superView.layer.cornerRadius/2)
            centerXConstraint?.isActive = true
            
            centerYConstraint?.isActive = false
            centerYConstraint = badgeView.bottomAnchor.constraint(equalTo: superView.topAnchor, constant: superView.layer.cornerRadius/4)
            centerYConstraint?.isActive = true
            
        case .bottomLeft:
            
            centerXConstraint?.isActive = false
            centerXConstraint = badgeView.trailingAnchor.constraint(equalTo: superView.leadingAnchor, constant: superView.layer.cornerRadius/4)
            centerXConstraint?.isActive = true
            
            centerYConstraint?.isActive = false
            centerYConstraint = badgeView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: superView.layer.cornerRadius/6)
            centerYConstraint?.isActive = true
            
        case .bottomRight:
            
            centerXConstraint?.isActive = false
            centerXConstraint = badgeView.leadingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -superView.layer.cornerRadius/4)
            centerXConstraint?.isActive = true
            
            centerYConstraint?.isActive = false
            centerYConstraint = badgeView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: superView.layer.cornerRadius/6)
            centerYConstraint?.isActive = true
            
        case let .custom(offset):
            centerXConstraint?.isActive = false
            centerXConstraint = badgeView.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: offset.x)
            centerXConstraint?.isActive = true
            
            centerYConstraint?.isActive = false
            centerYConstraint = badgeView.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: offset.y)
            centerYConstraint?.isActive = true
        }
    }
    
    private func updateHeightConstraint() {
        heightConstraint?.isActive = false
        heightConstraint = badgeView.heightAnchor.constraint(equalToConstant: height)
        heightConstraint?.isActive = true
    }
    
    private func updateWidthConstraint() {
        
        let width: CGFloat?
        switch type {
        case .none:
            width = 0
        case .point:
            width = height
        case .count(let count):
            if count > 0, let string = badgeView.text {
                if count >= 10 {
                    width = string.boundingWidth(with: badgeView.font)+(height-"0".boundingWidth(with: badgeView.font))
                } else {
                    width = height
                }
            } else {
                width = 0
            }
        case .custom(let result):
            if result.count > 0, let string = badgeView.text {
                width = string.boundingWidth(with: badgeView.font)+(height-"0".boundingWidth(with: badgeView.font))
            } else {
                width = 0
            }
        case .customRichText:
            width = nil
        }
        if let width = width {
            if let widthConstraint = widthConstraint {
                widthConstraint.constant = width
            } else {
                widthConstraint = badgeView.widthAnchor.constraint(equalToConstant: width)
                widthConstraint?.isActive = true
            }
        } else {
            widthConstraint?.isActive = false
            widthConstraint = nil
        }
    }
    
    private func updateCornerRadius() {
        
        switch type {
        case .none:
            break
        case .point, .count, .custom(_):
            badgeView.layer.cornerRadius = height/2
        case let .customRichText(_, _, cornerRadius):
            if let cornerRadius = cornerRadius {
                badgeView.layer.cornerRadius = cornerRadius
            } else {
                badgeView.layer.cornerRadius = height/2
            }
        }
    }
    
}


// MARK: - Description
internal extension String {
    
    func boundingWidth(with font: UIFont) -> CGFloat {
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: font.lineHeight)
        let preferredRect = (self as NSString).boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(preferredRect.width)
    }
}
