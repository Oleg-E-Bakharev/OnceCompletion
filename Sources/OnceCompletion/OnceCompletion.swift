@propertyWrapper
public final class Once<T> {
    private var value: T!

    public var wrappedValue: T {
        defer { value = nil }
        return value // If crash here, then twice called
    }

    public var projectedValue: Bool { value != nil }

    public init(wrappedValue value: T) {
        self.value = value
    }

    deinit {
        assert(value == nil, "Wrapped value must be accessed once")
    }
}
