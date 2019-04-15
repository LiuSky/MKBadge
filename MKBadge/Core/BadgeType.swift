//
//  BadgeType.swift
//  MKBadge
//
//  Created by xiaobin liu on 2019/2/13.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit
import Foundation


/// 角标类型
///
/// - none: 空
/// - point: 点
/// - count: 数量
/// - custom: 自定义文本
/// - custom: 自定义富文本
public enum BadgeType {
    case none
    case point
    case count(Int)
    case custom(String)
    case customRichText(_ attributedString: NSAttributedString, _ height: CGFloat?, _ cornerRadius: CGFloat?)
}


/// 位置类型
///
/// - topLeft: 左上对齐
/// - topRight: 右上对齐
/// - bottomLeft: 底部左对齐
/// - bottomRight: 底部右对齐
/// - custom: 自定义位置
public enum BadgePositionType {

    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case custom(offset: CGPoint)
}

