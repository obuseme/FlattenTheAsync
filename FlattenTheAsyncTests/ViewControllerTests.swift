//
//  ViewControllerTests.swift
//  ViewControllerTests
//
//  Created by Andrew Obusek on 8/20/20.
//  Copyright © 2020 Andy Obusek. All rights reserved.
//

import XCTest
@testable import FlattenTheAsync

class ViewControllerTests: XCTestCase {

    class MockAnimator: Animator {
        static func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void) {
            animations()
        }
    }

    class MockViewController: ViewController {
        var mockOnOffLabel = UILabel()
        override var onOffLabel: UILabel! {
            get {
                return mockOnOffLabel
            }
            set { }
        }
    }

    func testValueChanged_WhenSwitchTurnsOn_ShowsLabel() {
        let toTest = MockViewController()
        let mockAnimator = MockAnimator()
        let mockSwitch = UISwitch()
        mockSwitch.isOn = true
        toTest.animator = mockAnimator
        toTest.onOffLabel.alpha = 0.0

        XCTAssertEqual(0.0, toTest.onOffLabel.alpha)
        toTest.switchToggled(mockSwitch)
        XCTAssertEqual(1.0, toTest.onOffLabel.alpha)
    }

    func testValueChanged_WhenSwitchTurnsOff_HidesLabel() {
        let toTest = MockViewController()
        let mockAnimator = MockAnimator()
        let mockSwitch = UISwitch()
        mockSwitch.isOn = false
        toTest.animator = mockAnimator
        toTest.onOffLabel.alpha = 1.0

        XCTAssertEqual(1.0, toTest.onOffLabel.alpha)
        toTest.switchToggled(mockSwitch)
        XCTAssertEqual(0.0, toTest.onOffLabel.alpha)
    }

}
