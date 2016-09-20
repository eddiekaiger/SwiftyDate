
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
    
    let seconds: TimeInterval
    
    /**
        Initializes a new SwiftyDate object.
        - parameter     seconds:    The total number of seconds to be used as a relative timestamp.
    */
    public init(seconds: TimeInterval) {
        self.seconds = seconds
    }
    
    /**
        Returns a `Date` that represents the specified amount of time ahead of the current date.
    */
    public func fromNow() -> Date {
        return Date(timeIntervalSinceNow: seconds)
    }
    
    /**
        Returns a `Date` that represents the specified amount of time before the current date.
    */
    public func ago() -> Date {
        return before(Date())
    }
    
    /**
        Returns an `Date` that represents the specified amount of time after a certain date.
        - parameter     date:   The date of comparison.
    */
    public func after(_ date: Date) -> Date {
        return Date(timeInterval: seconds, since: date)
    }
    
    /**
        Returns a `Date` that represents the specified amount of time before a certain date.
        - parameter     date:   The date of comparison.
    */
    public func before(_ date: Date) -> Date {
        return Date(timeInterval: -seconds, since: date)
    }
}

/** Constants */
private let secondsInMinute: TimeInterval = 60
private let secondsInHour: TimeInterval = 3600
private let secondsInDay: TimeInterval = 86400
private let secondsInWeek: TimeInterval = 604800

public protocol TimeNumber {
    var timeValue: TimeInterval { get }
}

extension TimeNumber {

    private func swiftDate(_ secondsInUnit: TimeInterval) -> SwiftyDate {
        return SwiftyDate(seconds: timeValue * secondsInUnit)
    }

    public var seconds: SwiftyDate { return swiftDate(1) }
    public var minutes: SwiftyDate { return swiftDate(secondsInMinute) }
    public var hours: SwiftyDate { return swiftDate(secondsInHour) }
    public var days: SwiftyDate { return swiftDate(secondsInDay) }
    public var weeks: SwiftyDate { return swiftDate(secondsInWeek) }
}

extension UInt8: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension Int8: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension UInt16: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension Int16: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension UInt32: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension Int32: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension UInt64: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension Int64: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension UInt: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension Int: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension Float: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}

extension NSNumber: TimeNumber {
    public var timeValue: TimeInterval { return doubleValue }
}

extension TimeInterval: TimeNumber {
    public var timeValue: TimeInterval { return self }
}

extension CGFloat: TimeNumber {
    public var timeValue: TimeInterval { return TimeInterval(self) }
}
