//
//  ViewController.swift
//  MKBadge
//
//  Created by LiuSky on 05/21/2020.
//  Copyright (c) 2020 LiuSky. All rights reserved.
//

import UIKit
import MKBadge

/// MARK - Demo
final class ViewController: UIViewController {

    /// 点角标按钮
    private lazy var pointButton: UIButton = {
       let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.red
        temButton.setTitle("点角标", for: .normal)
        temButton.setTitleColor(UIColor.white, for: .normal)
        temButton.frame = CGRect(x: self.view.frame.size.width/2 - 44, y: 120, width: 88, height: 44)
        temButton.layer.cornerRadius = 22
        temButton.badge.type = .point
        temButton.badge.positionType = .topRight
        return temButton
    }()
    
    
    /// 数量角标按钮
    private lazy var numberButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.blue
        temButton.setTitle("数量角标", for: .normal)
        temButton.setTitleColor(UIColor.white, for: .normal)
        temButton.frame = CGRect(x: self.view.frame.size.width/2 - 44, y: self.pointButton.frame.origin.y + 44 + 20, width: 88, height: 44)
        temButton.layer.cornerRadius = 22
        temButton.badge.type = .count(12)
        temButton.badge.fontSize = 12
        temButton.badge.height = 14
        temButton.badge.positionType = .topLeft
        return temButton
    }()
    
    /// 最小数量角标
    private lazy var minNumberButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.gray
        temButton.setTitle("最小数量角标", for: .normal)
        temButton.setTitleColor(UIColor.white, for: .normal)
        temButton.frame = CGRect(x: self.view.frame.size.width/2 - 60, y: self.numberButton.frame.origin.y + 44 + 20, width: 120, height: 44)
        temButton.layer.cornerRadius = 22
        temButton.badge.type = .count(1)
        temButton.badge.height = 14
        return temButton
    }()
    
    
    /// 最大数量角标
    private lazy var maxNumberButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.black
        temButton.setTitle("最大数量角标", for: .normal)
        temButton.setTitleColor(UIColor.white, for: .normal)
        temButton.frame = CGRect(x: self.view.frame.size.width/2 - 60, y: self.minNumberButton.frame.origin.y + 44 + 20, width: 120, height: 44)
        temButton.layer.cornerRadius = 22
        temButton.badge.positionType = .bottomLeft
        temButton.badge.type = .count(100)
        temButton.badge.height = 14
        return temButton
    }()
    
    
    /// 背景颜色角标
    private lazy var colorButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.green
        temButton.setTitle("背景颜色角标", for: .normal)
        temButton.setTitleColor(UIColor.white, for: .normal)
        temButton.frame = CGRect(x: self.view.frame.size.width/2 - 60, y: self.maxNumberButton.frame.origin.y + 44 + 20, width: 120, height: 44)
        temButton.layer.cornerRadius = 22
        temButton.badge.type = .count(12)
        temButton.badge.height = 14
        temButton.badge.backgroundColor = UIColor.black
        temButton.badge.positionType = .bottomRight
        return temButton
    }()
    
    /// 角标文本颜色按钮
    private lazy var textColorButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.purple
        temButton.setTitle("角标文本颜色", for: .normal)
        temButton.setTitleColor(UIColor.white, for: .normal)
        temButton.frame = CGRect(x: self.view.frame.size.width/2 - 60, y: self.colorButton.frame.origin.y + 44 + 20, width: 120, height: 44)
        temButton.layer.cornerRadius = 22
        temButton.badge.type = .count(12)
        temButton.badge.height = 14
        temButton.badge.backgroundColor = UIColor.lightGray
        temButton.badge.textColor = UIColor.red
        return temButton
    }()
    
    
    /// 左对齐角标
    private lazy var leftButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.brown
        temButton.setTitle("左对齐角标", for: .normal)
        temButton.setTitleColor(UIColor.white, for: .normal)
        temButton.frame = CGRect(x: self.view.frame.size.width/2 - 60, y: self.textColorButton.frame.origin.y + 44 + 20, width: 120, height: 44)
        temButton.layer.cornerRadius = 22
        temButton.badge.positionType = .topLeft
        temButton.badge.type = .count(100)
        temButton.badge.height = 14
        return temButton
    }()
    
    
    /// 变化角标按钮
    private lazy var changeButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.magenta
        temButton.setTitle("点击按钮", for: .normal)
        temButton.setTitleColor(UIColor.white, for: .normal)
        temButton.frame = CGRect(x: self.view.frame.size.width/2 - 60, y: self.leftButton.frame.origin.y + 44 + 20, width: 120, height: 44)
        temButton.layer.cornerRadius = 22
        temButton.badge.type = .count(12)
        temButton.badge.height = 14
        temButton.addTarget(self, action: #selector(eventForChange(_:)), for: .touchUpInside)
        return temButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "角标"
        self.view.addSubview(pointButton)
        self.view.addSubview(numberButton)
        self.view.addSubview(minNumberButton)
        self.view.addSubview(maxNumberButton)
        self.view.addSubview(colorButton)
        self.view.addSubview(textColorButton)
        self.view.addSubview(leftButton)
        self.view.addSubview(changeButton)
    }
    
    
    /// Description
    ///
    /// - Parameter sender: sender description
    @objc private func eventForChange(_ sender: UIButton) {
        
        sender.badge.type = BadgeType.random
        sender.badge.positionType = BadgePositionType.random
    }
    
}


extension BadgeType: CaseIterable {
    
    public static var allCases: [BadgeType] {
        return [.none, .point, .count(1), .count(3), .count(6), .count(10), .count(15),
                .count(21), .count(28), .count(36), .count(99), .count(888), .count(1001), .custom("新的"),
                .custom("新"), .custom("新的消息"), .custom("哈哈"),
        ]
    }
    
    public static var random: BadgeType {
        let index = Int.random(in: 0..<BadgeType.allCases.count)
        return BadgeType.allCases[index]
    }
}


// MARK: - <#CaseIterable#>
extension BadgePositionType: CaseIterable {
    
    public static var allCases: [BadgePositionType] {
        return [BadgePositionType.topLeft,
                BadgePositionType.topRight,
                BadgePositionType.bottomLeft,
                BadgePositionType.bottomRight,]
    }
    
    public static var random: BadgePositionType {
        let index = Int.random(in: 0..<BadgePositionType.allCases.count)
        return BadgePositionType.allCases[index]
    }
}

