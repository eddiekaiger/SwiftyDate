
import Foundation
import UIKit

public class SwiftDate {
    
    private let value: NSTimeInterval
    private let seconds: NSTimeInterval
    
    public init(value: NSTimeInterval, seconds: NSTimeInterval) {
        self.value = value
        self.seconds = seconds
    }
    
    public func fromNow() -> NSDate {
        return NSDate(timeIntervalSinceNow: seconds)
    }
    
    public func ago() -> NSDate {
        return before(NSDate())
    }

    public func after(date: NSDate) -> NSDate {
        return NSDate(timeInterval: seconds, sinceDate: date)
    }
    
    public func before(date: NSDate) -> NSDate {
        return NSDate(timeInterval: -seconds, sinceDate: date)
    }
}

private let secondsInMinute: NSTimeInterval = 60
private let secondsInHour: NSTimeInterval = 3600
private let secondsInDay: NSTimeInterval = 86400
private let secondsInWeek: NSTimeInterval = 604800

extension NSTimeInterval {
    
    private func swiftDate(secondsInUnit: NSTimeInterval) -> SwiftDate {
        return SwiftDate(value: self, seconds: self * secondsInUnit)
    }
    
    public var seconds: SwiftDate { return swiftDate(self) }
    public var minutes: SwiftDate { return swiftDate(secondsInMinute) }
    public var hours: SwiftDate { return swiftDate(secondsInHour) }
    public var days: SwiftDate { return swiftDate(secondsInDay) }
    public var weeks: SwiftDate { return swiftDate(secondsInWeek) }
}

extension Int {
    public var seconds: SwiftDate { return NSTimeInterval(self).seconds }
    public var minutes: SwiftDate { return NSTimeInterval(self).minutes }
    public var hours: SwiftDate { return NSTimeInterval(self).hours }
    public var days: SwiftDate { return NSTimeInterval(self).days }
    public var weeks: SwiftDate { return NSTimeInterval(self).weeks }
}

extension CGFloat {
    public var seconds: SwiftDate { return NSTimeInterval(self).seconds }
    public var minutes: SwiftDate { return NSTimeInterval(self).minutes }
    public var hours: SwiftDate { return NSTimeInterval(self).hours }
    public var days: SwiftDate { return NSTimeInterval(self).days }
    public var weeks: SwiftDate { return NSTimeInterval(self).weeks }
}

extension Float {
    public var seconds: SwiftDate { return NSTimeInterval(self).seconds }
    public var minutes: SwiftDate { return NSTimeInterval(self).minutes }
    public var hours: SwiftDate { return NSTimeInterval(self).hours }
    public var days: SwiftDate { return NSTimeInterval(self).days }
    public var weeks: SwiftDate { return NSTimeInterval(self).weeks }
}

