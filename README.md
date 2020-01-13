# MDatePickerView

<img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView_Photo.png" width="200" height="420"/> <img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView.gif" width="200" height="420"/> <img src="https://matt-bucket-images.s3-ap-southeast-1.amazonaws.com/MDatePickerView_Photo-2.png" width="200" height="420"/>


```swift
    lazy var MDate : MDatePickerView = {
        let mdate = MDatePickerView()
        mdate.Color = .gray
        mdate.delegate = self
        return mdate
    }()
```

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
