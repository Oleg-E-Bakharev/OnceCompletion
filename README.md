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
            XCTAssertFalse($completion)
        }

        testOnce {
            print("Complete")
        }
    }

    func testOnceWithParam() {
        let exp = expectation(description: "Test")
        func testOnce(@Once completion: @escaping (Int) -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                XCTAssertTrue($completion)
                completion(1)
                XCTAssertFalse($completion)
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
