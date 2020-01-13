<img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView_Photo.png" width="200" height="420"/> <img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView.gif" width="200" height="420"/> <img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView_Photo-2.png" width="200" height="420"/>

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

```swift
lazy var MDate : MDatePickerView = {
        let mdate = MDatePickerView()
        mdate.Color = .gray
        mdate.delegate = self
        return mdate
    }()
```
## Usage example

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
