## Requirements:
- **iOS** 9.0+
- Xcode 10.1+
- Swift 4.2+

## Installation Cocoapods
<pre><code class="ruby language-ruby">pod 'MKBadge', '~> 1.0.1'</code></pre>

## Demo Figure
<p align="center">
<img src="https://github.com/LiuSky/MKBadge/blob/master/1.png?raw=true" title="演示图">
</p>

## Usage
### 1. 点角标按钮
```swift 
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
```

### 2.数量角标按钮
```swift
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
```

### 3.最小数量按钮
```swift
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
```
### 4.最大数量按钮
```swift
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
``` 

### 5.颜色角标按钮  
```swift
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
``` 

### 6.角标文本颜色按钮
```swift
private lazy var textColorButton: UIButton = {
let temButton = UIButton(type: .custom)
temButton.backgroundColor = UIColor.purple
temButton.setTitle("背景颜色角标", for: .normal)
temButton.setTitleColor(UIColor.white, for: .normal)
temButton.frame = CGRect(x: self.view.frame.size.width/2 - 60, y: self.colorButton.frame.origin.y + 44 + 20, width: 120, height: 44)
temButton.layer.cornerRadius = 22
temButton.badge.type = .count(12)
temButton.badge.height = 14
temButton.badge.backgroundColor = UIColor.lightGray
temButton.badge.textColor = UIColor.red
return temButton
}()
```

### 7.左对齐角标按钮
```swift
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
```

### 8.变化角标按钮
```swift
private lazy var changeButton: UIButton = {
let temButton = UIButton(type: .custom)
temButton.backgroundColor = UIColor.magenta
temButton.setTitle("点击按钮", for: .normal)
temButton.setTitleColor(UIColor.white, for: .normal)
temButton.frame = CGRect(x: self.view.frame.size.width/2 - 60, y: self.leftButton.frame.origin.y + 44 + 20, width: 120, height: 44)
temButton.layer.cornerRadius = 22
temButton.layer.cornerRadius = 22
temButton.badge.type = .count(12)
temButton.badge.height = 14
temButton.addTarget(self, action: #selector(eventForChange(_:)), for: .touchUpInside)
return temButton
}()
```

## Reference
<ul>
<li><a href="https://github.com/Jiar/SegementSlide/blob/master/Source/Segement/BadgeView.swift"><code>SegementSlide</code></a></li>
</ul>


## License
MKBadge is released under an MIT license. See [LICENSE](LICENSE) for more information.

