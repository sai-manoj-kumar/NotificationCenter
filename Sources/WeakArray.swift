import Foundation

@propertyWrapper
public class Weak<Element> where Element: AnyObject {
    private var storedValue: [Element] = []
    public var wrappedValue: [Element] {
        get {
            return []
        }
        set {
            
        }
    }



    public init() {
        wrappedValue = []
    }

}
