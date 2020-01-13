<div align="center">
<img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView_Photo-3.png" width="200" height="420"/> <img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView.gif" width="200" height="420"/> <img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView_Photo-2.png" width="200" height="420"/> <img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView_Photo-4.png" width="200" height="420"/>
</div>
<h1></h1>
<div align="center">
<p><a href="https://camo.githubusercontent.com/0188e770bbde9d9eae6720a70d5d3fad0952d77b/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f53776966742d322e322d6f72616e67652e737667" target="_blank"><img src="https://img.shields.io/badge/Swift-4-orange.svg"></a>
<a href="http://cocoapods.org/pods/MDatePickerView."><img src="https://img.shields.io/cocoapods/v/MDatePickerView.svg?style=flat"></a>
<a href="http://cocoapods.org/pods/glitchlabel"><img alt="License" src="https://img.shields.io/cocoapods/l/GlitchLabel.svg?style=flat"></a>
<a href="http://cocoapods.org/pods/glitchlabel"><img alt="Platform" src="https://img.shields.io/cocoapods/p/GlitchLabel.svg?style=flat"></a>
<a href="https://travis-ci.org/kciter/GlitchLabel"><img alt="Build Status" src="https://travis-ci.org/kciter/GlitchLabel.svg?branch=master"></a></p>
</div>

## Requirements 
- iOS 9.0
- Xcode 9
- Swift 4.0

## Installation
You can install MDatePickerView in several ways:

Add source files to your project.
- Use CocoaPods:

```swift
pod 'MDatePickerView'
```

## Usage
```swift
import MDatePickerView
```

## Usage example
```swift
lazy var MDate : MDatePickerView = {
        let mdate = MDatePickerView()
        mdate.Color = .gray
        mdate.delegate = self
        mdate.from = 1980
        mdate.to = 2100
        return mdate
    }()
```

**Adopt the MDatePickerViewDelegate protocol in your view controller, e.g.**
```swift
extension ViewController : MDatePickerViewDelegate {
    func mdatePickerView(selectDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy - MM - dd"
        let date = formatter.string(from: selectDate)
        Label.text = date
    }
}
```

## What's next
- Any suggestions?

## Contribution

- If you found a bug, open an issue
- If you have a feature request, open an issue
- If you want to contribute, submit a pull request
- If you have any issue or want help, please drop me a mail on bowei685@gmail.com

## License

    The MIT License (MIT)

    Copyright © 2020 Matt

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
