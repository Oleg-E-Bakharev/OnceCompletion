import XCTest
@testable import OnceCompletion

final class OnceCompletionTests: XCTestCase {
    func testOnceZ() {
        func testOnce(@Once completion: @escaping () -> Void) {
            completion()
        }

        testOnce {
            print("Complete")
        }
    }

    func testOnce() {
        func testOnce(@Once completion: @escaping (Int) -> Void) {
            completion(1)
        }

        testOnce { value in
            print("Complete value: \(value)")
        }
    }

}
