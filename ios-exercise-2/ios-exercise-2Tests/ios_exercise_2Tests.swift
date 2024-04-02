//
//  ios_exercise_2Tests.swift
//  ios-exercise-2Tests
//
//  Created by bayteq on 26/3/24.
//
import InlineSnapshotTesting

import SnapshotTesting
import XCTest
@testable import ios_exercise_2

final class ios_exercise_2Tests: XCTestCase {

    override func setUp() {
        super.setUp()
       diffTool = "ksdiff"
        //isRecording = true
      }

    
    func testViewControllerOriginalState() {
        let vc = ViewController.instantiate()
        assertSnapshot(of: vc, as: .image)
    
    }
    
    func testWaitChar() {
       var value = "Hello"
       DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
         value = "Goodbye"
       }

       let strategy = Snapshotting.lines.pullback { (_: Void) in
         value
       }

       assertSnapshot(of: (), as: .wait(for: 1.5, on: strategy))
     }
    
    func testWaitImage() {
        let vc = ProductListViewController.instantiate()
        
        assertSnapshot(
                    matching: vc,
                    as: .wait(for: 5, on: .image(on: .iPhone13))
                )
     }
    
    func testDifferentDevices(){
        let viewController = ViewController.instantiate()

                #if os(iOS)
                  assertSnapshot(of: viewController, as: .image(on: .iPhoneSe), named: "iphone-se")
                  assertSnapshot(of: viewController, as: .image(on: .iPhone8), named: "iphone-8")
                  assertSnapshot(of: viewController, as: .image(on: .iPhone8Plus), named: "iphone-8-plus")
                  assertSnapshot(of: viewController, as: .image(on: .iPhoneX), named: "iphone-x")
                  assertSnapshot(of: viewController, as: .image(on: .iPhoneXr), named: "iphone-xr")
                  assertSnapshot(of: viewController, as: .image(on: .iPhoneXsMax), named: "iphone-xs-max")
                  assertSnapshot(of: viewController, as: .image(on: .iPadMini), named: "ipad-mini")
                  assertSnapshot(of: viewController, as: .image(on: .iPad9_7), named: "ipad-9-7")
                  assertSnapshot(of: viewController, as: .image(on: .iPad10_2), named: "ipad-10-2")
                  assertSnapshot(of: viewController, as: .image(on: .iPadPro10_5), named: "ipad-pro-10-5")
                  assertSnapshot(of: viewController, as: .image(on: .iPadPro11), named: "ipad-pro-11")
                  assertSnapshot(of: viewController, as: .image(on: .iPadPro12_9), named: "ipad-pro-12-9")

                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPhoneSe), named: "iphone-se")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPhone8), named: "iphone-8")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPhone8Plus), named: "iphone-8-plus")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPhoneX), named: "iphone-x")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPhoneXr), named: "iphone-xr")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPhoneXsMax), named: "iphone-xs-max")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPadMini), named: "ipad-mini")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPad9_7), named: "ipad-9-7")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPad10_2), named: "ipad-10-2")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPadPro10_5), named: "ipad-pro-10-5")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPadPro11), named: "ipad-pro-11")
                  assertSnapshot(
                    of: viewController, as: .recursiveDescription(on: .iPadPro12_9), named: "ipad-pro-12-9")

                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhoneSe(.portrait)), named: "iphone-se")
                  assertSnapshot(of: viewController, as: .image(on: .iPhone8(.portrait)), named: "iphone-8")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhone8Plus(.portrait)), named: "iphone-8-plus")
                  assertSnapshot(of: viewController, as: .image(on: .iPhoneX(.portrait)), named: "iphone-x")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhoneXr(.portrait)), named: "iphone-xr")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhoneXsMax(.portrait)), named: "iphone-xs-max")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadMini(.landscape)), named: "ipad-mini")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad9_7(.landscape)), named: "ipad-9-7")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad10_2(.landscape)), named: "ipad-10-2")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro10_5(.landscape)), named: "ipad-pro-10-5")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro11(.landscape)), named: "ipad-pro-11")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro12_9(.landscape)), named: "ipad-pro-12-9")

                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadMini(.landscape(splitView: .oneThird))),
                    named: "ipad-mini-33-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadMini(.landscape(splitView: .oneHalf))),
                    named: "ipad-mini-50-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadMini(.landscape(splitView: .twoThirds))),
                    named: "ipad-mini-66-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadMini(.portrait(splitView: .oneThird))),
                    named: "ipad-mini-33-split-portrait")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadMini(.portrait(splitView: .twoThirds))),
                    named: "ipad-mini-66-split-portrait")

                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad9_7(.landscape(splitView: .oneThird))),
                    named: "ipad-9-7-33-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad9_7(.landscape(splitView: .oneHalf))),
                    named: "ipad-9-7-50-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad9_7(.landscape(splitView: .twoThirds))),
                    named: "ipad-9-7-66-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad9_7(.portrait(splitView: .oneThird))),
                    named: "ipad-9-7-33-split-portrait")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad9_7(.portrait(splitView: .twoThirds))),
                    named: "ipad-9-7-66-split-portrait")

                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad10_2(.landscape(splitView: .oneThird))),
                    named: "ipad-10-2-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad10_2(.landscape(splitView: .oneHalf))),
                    named: "ipad-10-2-50-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad10_2(.landscape(splitView: .twoThirds))),
                    named: "ipad-10-2-66-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad10_2(.portrait(splitView: .oneThird))),
                    named: "ipad-10-2-33-split-portrait")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad10_2(.portrait(splitView: .twoThirds))),
                    named: "ipad-10-2-66-split-portrait")

                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro10_5(.landscape(splitView: .oneThird))),
                    named: "ipad-pro-10inch-33-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro10_5(.landscape(splitView: .oneHalf))),
                    named: "ipad-pro-10inch-50-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro10_5(.landscape(splitView: .twoThirds))),
                    named: "ipad-pro-10inch-66-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro10_5(.portrait(splitView: .oneThird))),
                    named: "ipad-pro-10inch-33-split-portrait")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro10_5(.portrait(splitView: .twoThirds))),
                    named: "ipad-pro-10inch-66-split-portrait")

                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro11(.landscape(splitView: .oneThird))),
                    named: "ipad-pro-11inch-33-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro11(.landscape(splitView: .oneHalf))),
                    named: "ipad-pro-11inch-50-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro11(.landscape(splitView: .twoThirds))),
                    named: "ipad-pro-11inch-66-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro11(.portrait(splitView: .oneThird))),
                    named: "ipad-pro-11inch-33-split-portrait")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro11(.portrait(splitView: .twoThirds))),
                    named: "ipad-pro-11inch-66-split-portrait")

                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro12_9(.landscape(splitView: .oneThird))),
                    named: "ipad-pro-12inch-33-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro12_9(.landscape(splitView: .oneHalf))),
                    named: "ipad-pro-12inch-50-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro12_9(.landscape(splitView: .twoThirds))),
                    named: "ipad-pro-12inch-66-split-landscape")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro12_9(.portrait(splitView: .oneThird))),
                    named: "ipad-pro-12inch-33-split-portrait")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro12_9(.portrait(splitView: .twoThirds))),
                    named: "ipad-pro-12inch-66-split-portrait")

                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhoneSe(.landscape)),
                    named: "iphone-se-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhone8(.landscape)), named: "iphone-8-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhone8Plus(.landscape)),
                    named: "iphone-8-plus-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhoneX(.landscape)), named: "iphone-x-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhoneXr(.landscape)),
                    named: "iphone-xr-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPhoneXsMax(.landscape)),
                    named: "iphone-xs-max-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadMini(.portrait)), named: "ipad-mini-alternative"
                  )
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad9_7(.portrait)), named: "ipad-9-7-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPad10_2(.portrait)), named: "ipad-10-2-alternative"
                  )
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro10_5(.portrait)),
                    named: "ipad-pro-10-5-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro11(.portrait)),
                    named: "ipad-pro-11-alternative")
                  assertSnapshot(
                    of: viewController, as: .image(on: .iPadPro12_9(.portrait)),
                    named: "ipad-pro-12-9-alternative")
             
            #endif
    }

    func testAny() {
      let user = UserRequest(username: "test", password: "test")
      assertSnapshot(of: user, as: .dump)
    }

    func testAnySnapshotStringToDateConvertible() {
        let date = "2024-03-16".toDate()
        assertSnapshot(of: date, as: .dump, named: "date")
     }
    
    func testAnySnapshotDateToStringConvertible() {
        let date = "2024-03-16".toDate()?.toString(withFormat: "HH:mm:ss")
        assertSnapshot(of: date, as: .dump, named: "string")
     }
    
    func testAnySnapshotURLConvertible() {
        assertSnapshot(of: URL(string: ApiManagerSwifty.serverURL)!, as: .dump, named: "url")
      }
    
    func testPrecision() {
        let vc = PasswordViewController.instantiate()
        assertSnapshot(of: vc, as: .image(perceptualPrecision: 0.50), named: "precision")
    }
    
    
    func testExtensionWaitController() {
      let vc = InfoViewController.instantiate()

      // Assert the snapshot after waiting...
      assertSnapshot(matching: vc, as: .waiting(for: 3, on: .image))
    }
    
    func testWait() {
        let sut = InfoViewController.instantiate()
        assertSnapshot(matching: sut.view, as: .wait(for: 5, on: .image))
    }

}

extension Snapshotting {
  static func waiting(
    for duration: TimeInterval,
    on strategy: Snapshotting
  ) -> Snapshotting {
    return strategy.pullback { value in
      let expectation = XCTestExpectation(description: "Wait")
      DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
        expectation.fulfill()
      }
      _ = XCTWaiter.wait(for: [expectation], timeout: duration + 1)
      return value
    }
  }
}
//Snapshot Anything
// verificar diferencias
