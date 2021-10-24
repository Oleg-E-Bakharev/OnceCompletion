@propertyWrapper
public final class Once<T> {
    private var value: T!

    public var wrappedValue: T {
        get {
            defer { value = nil }
            return value // If crash here, then twice called
        }
    }

    public init(wrappedValue value: T) {
        self.value = value
    }

    deinit {
        guard value == nil else {
            assert(false, "Block must be called once")
        }
    }
}