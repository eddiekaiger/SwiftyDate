
/**

The MIT License (MIT)

Copyright (c) 2015 Eddie Kaiger

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

*/


import Foundation

/**
This class is used as the middleman for easily constructing a relative date
based on extensions from Swift number types. It is not intended to be used
independently. Instead, use SwiftyDate's extensions to construct statements
such as `12.days.ago()`.
*/
public struct SwiftyDate {
    
    private let seconds: NSTimeInterval
    
    /**
    Initializes a new SwiftyDate object.
    :param:  seconds  The total number of seconds to be used as a relative timestamp.
    */
    public init(seconds: NSTimeInterval) {
        self.seconds = seconds
    }
    
    /**
    Returns an `NSDate` that represents the specified amount of time ahead of the current date.
    */
    public func fromNow() -> NSDate {
        return NSDate(timeIntervalSinceNow: seconds)
    }
    
    /**
    Returns an `NSDate` that represents the specified amount of time before the current date.
    */
    public func ago() -> NSDate {
        return before(NSDate())
    }
    
    /**
    Returns an `NSDate` that represents the specified amount of time after a certain date.
    :param:  date  The date of comparison.
    */
    public func after(date: NSDate) -> NSDate {
        return NSDate(timeInterval: seconds, sinceDate: date)
    }
    
    /**
    Returns an `NSDate` that represents the specified amount of time before a certain date.
    :param:  date  The date of comparison.
    */
    public func before(date: NSDate) -> NSDate {
        return NSDate(timeInterval: -seconds, sinceDate: date)
    }
}

/** Constants */
private let secondsInMinute: NSTimeInterval = 60
private let secondsInHour: NSTimeInterval = 3600
private let secondsInDay: NSTimeInterval = 86400
private let secondsInWeek: NSTimeInterval = 604800


extension NSTimeInterval {
    
    private func swiftDate(secondsInUnit: NSTimeInterval) -> SwiftyDate {
        return SwiftyDate(seconds: self * secondsInUnit)
    }
    
    public var seconds: SwiftyDate { return swiftDate(self) }
    public var minutes: SwiftyDate { return swiftDate(secondsInMinute) }
    public var hours: SwiftyDate { return swiftDate(secondsInHour) }
    public var days: SwiftyDate { return swiftDate(secondsInDay) }
    public var weeks: SwiftyDate { return swiftDate(secondsInWeek) }
}

extension Int {
    public var seconds: SwiftyDate { return NSTimeInterval(self).seconds }
    public var minutes: SwiftyDate { return NSTimeInterval(self).minutes }
    public var hours: SwiftyDate { return NSTimeInterval(self).hours }
    public var days: SwiftyDate { return NSTimeInterval(self).days }
    public var weeks: SwiftyDate { return NSTimeInterval(self).weeks }
}

extension CGFloat {
    public var seconds: SwiftyDate { return NSTimeInterval(self).seconds }
    public var minutes: SwiftyDate { return NSTimeInterval(self).minutes }
    public var hours: SwiftyDate { return NSTimeInterval(self).hours }
    public var days: SwiftyDate { return NSTimeInterval(self).days }
    public var weeks: SwiftyDate { return NSTimeInterval(self).weeks }
}

extension Float {
    public var seconds: SwiftyDate { return NSTimeInterval(self).seconds }
    public var minutes: SwiftyDate { return NSTimeInterval(self).minutes }
    public var hours: SwiftyDate { return NSTimeInterval(self).hours }
    public var days: SwiftyDate { return NSTimeInterval(self).days }
    public var weeks: SwiftyDate { return NSTimeInterval(self).weeks }
}

extension NSNumber {
    public var seconds: SwiftyDate { return doubleValue.seconds }
    public var minutes: SwiftyDate { return doubleValue.minutes }
    public var hours: SwiftyDate { return doubleValue.hours }
    public var days: SwiftyDate { return doubleValue.days }
    public var weeks: SwiftyDate { return doubleValue.weeks }
}

