// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "MDatePickerView",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "MDatePickerView",
            targets: ["MDatePickerView"]
        )
    ],
    targets: [
        .target(
            name: "MDatePickerView",
            path: "MDatePickerView/"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
let version = Version(1, 2, 3)
