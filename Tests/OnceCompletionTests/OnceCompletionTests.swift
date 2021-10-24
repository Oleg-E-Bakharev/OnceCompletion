import XCTest
import OnceCompletion

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
        func testOnce(@Once completion: @escaping (Int) -> Void) {
            completion(1)
        }

        testOnce { value in
            print("Complete value: \(value)")
        }
    }
}
