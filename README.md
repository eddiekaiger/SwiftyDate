# SwiftyDate

**_SwiftyDate_ allows you to easily create relative NSDates in Swift.**

It extends the Swift number types to allow you to create expressions like this:

```swift
let pastDate = 12.days.ago()
let futureDate = 7.weeks.fromNow()
let beforeDate = 5.minutes.before(anotherDate)a
let afterDate = 15.hours.after(anotherDate)
````



### Installation

CocoaPods

````pod 'SwiftyDate', '~>1.0'````