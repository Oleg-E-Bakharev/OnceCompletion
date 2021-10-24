# OnceCompletion

@Once property wrapper for guarantee single call of completion in asynchronous functions

# Usage

```swift
import XCTest
import OnceCompletion
import Foundation

final class OnceCompletionTests: XCTestCase {
    func testOnceWithoutParams() {
        func testOnce(@Once completion: @escaping () -> Void) {
            completion()
            XCTAssert($completion == nil)
        }

        testOnce {
            print("Complete")
        }
    }

    func testOnceWithParam() {
        let exp = expectation(description: "Test")
        func testOnce(@Once completion: @escaping (Int) -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                XCTAssert($completion != nil)
                completion(1)
                XCTAssert($completion == nil)
            }
        }

        testOnce { value in
            exp.fulfill()
            print("Complete value: \(value)")
        }

        waitForExpectations(timeout: 1)
    }
}
```
