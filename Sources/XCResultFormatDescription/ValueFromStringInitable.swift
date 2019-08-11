
import Foundation


// in 3.20 schema is invalid - xcresulttool always returns strings for non-string value types
public protocol _ValueFromStringInitable {
    init(fromValueString string: String)
}

extension Int: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)!
    }
}

extension Float: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)!
    }
}

extension Double: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)!
    }
}

extension String: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)
    }
}

extension Bool: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)!
    }
}

extension Date: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self.init(timeIntervalSince1970: formatter.date(from: string)!.timeIntervalSince1970)
    }
}
