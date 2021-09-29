import Foundation

public struct SaiNotificationInfo {
    var observer: AnyObject
    var selector: Selector
    var name: String
    var object: AnyObject?
}

public class SaiNotificationCenter {
    var observers:[SaiNotificationInfo] = []
    static var current: SaiNotificationCenter = SaiNotificationCenter()


    func addObserver(observer: AnyObject, selector: Selector, name: String, object: AnyObject?) {
        observers.append(SaiNotificationInfo(observer: observer, selector: selector, name: name, object: object))
    }


    func removeObserver(observer: AnyObject, name: String, object: AnyObject?) {
        observers.removeAll(where: { $0.name == name && $0.observer === observer && $0.object === object } )
    }

    func post(name: String, object: AnyObject?) {
        observers.filter{ $0.name == name && $0.object === object }.map { notificationInfo in
            notificationInfo.observer.perform(notificationInfo.selector)
        }
    }

    public init() {
        
    }

}

public class SaiObserver {
    let notificationCenter = SaiNotificationCenter.current

    @objc
    func func1() {
        print("Observing func called")
    }

    public func addObs() {
        notificationCenter.addObserver(observer: self, selector: #selector(func1), name: "Notification1", object: nil)
    }

    public func postNotification() {
        notificationCenter.post(name: "Notification1", object: nil)
    }

    public func removeObs() {
        notificationCenter.removeObserver(observer: self, name: "Notification1", object: nil)
    }

    public init() {

    }
}


