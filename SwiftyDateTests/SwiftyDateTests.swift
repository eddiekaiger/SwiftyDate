//
//  SwiftyDateTests.swift
//  SwiftyDateTests
//
//  Created by Eddie Kaiger on 9/20/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
@testable import SwiftyDate

class SwiftyDateTests: XCTestCase {
    
    func testInitializer_setsSeconds() {
        XCTAssertEqual(SwiftyDate(seconds: 12).seconds, 12)
        XCTAssertEqual(SwiftyDate(seconds: 3.2).seconds, 3.2)
    }

    func testTimeNumber_createsSwiftyDate_withSeconds() {
        XCTAssertEqual(16.seconds.seconds, 16)
    }

    func testTimeNumber_createsSwiftyDate_withMinutes() {
        XCTAssertEqual(4.2.minutes.seconds, 252)
    }

    func testTimeNumber_createsSwiftyDate_withHours() {
        XCTAssertEqual(3.1.hours.seconds, 11160)
    }

    func testTimeNumber_createsSwiftyDate_withDays() {
        XCTAssertEqual(14.days.seconds, 1209600)
    }

    func testTimeNumber_createsSwiftyDate_withWeeks() {
        XCTAssertEqual(1.5.weeks.seconds, 907200)
    }

    func testSwiftyDate_fromNow() {
        XCTAssertEqual(Int(SwiftyDate(seconds: 18).fromNow().timeIntervalSince1970), Int(Date(timeIntervalSinceNow: 18).timeIntervalSince1970))
    }

    func testSwiftyDate_ago() {
        XCTAssertEqual(Int(SwiftyDate(seconds: 78).ago().timeIntervalSince1970), Int(Date(timeInterval: -78, since: Date()).timeIntervalSince1970))
    }

    func testSwiftyDate_after() {
        let now = Date()
        XCTAssertEqual(Int(SwiftyDate(seconds: 15.5).after(now).timeIntervalSince1970), Int(Date.init(timeInterval: 15.5, since: now).timeIntervalSince1970))
    }

    func testSwiftyDate_before() {
        let now = Date()
        XCTAssertEqual(Int(SwiftyDate(seconds: 120).after(now).timeIntervalSince1970), Int(Date(timeInterval: 120, since: now).timeIntervalSince1970))
    }
    
}
