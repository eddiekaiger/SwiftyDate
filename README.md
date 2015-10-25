# SwiftyDate

**_SwiftyDate_ allows you to easily create relative NSDates in Swift.**

It extends the Swift number types to allow you to create expressions like this:

```swift
let pastDate = 12.days.ago()
let futureDate = 7.weeks.fromNow()
let beforeDate = 5.minutes.before(anotherDate)
let afterDate = 15.hours.after(anotherDate)
````

Includes extensions for `NSTimeInterval`, `Double`, `Int`, `Float`, `CGFloat`, and `NSNumber`.

Time interval types:
* seconds
* minutes
* hours
* days
* weeks

Functions to generate dates:
* `fromNow()`
* `ago()`
* `after(date: NSDate)`
* `before(date: NSDate)`




### Installation

CocoaPods

````pod 'SwiftyDate', '~>1.0'````

___

_Original idea by my friend [Joe](http://github.com/JoeFerrucci)._

