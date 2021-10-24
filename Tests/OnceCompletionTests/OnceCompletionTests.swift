import XCTest
import OnceCompletion
import Foundation

final class OnceCompletionTests: XCTestCase {
    func testOnceWithoutParams() {
        func testOnce(@Once completion: @escaping () -> Void) {
            completion()
        }

        testOnce {
            print("Complete")
        }
    }

    func testOnceWithParam() {
        let exp = expectation(description: "Test")
        func testOnce(@Once completion: @escaping (Int) -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                completion(1)
            }
        }

        testOnce { value in
            exp.fulfill()
            print("Complete value: \(value)")
        }

        waitForExpectations(timeout: 1)
    }
}
