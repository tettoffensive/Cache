import Foundation

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

struct TestHelper {
  static func data(_ length : Int) -> Data {
    let buffer = [UInt8](repeating: 0, count: length)
    return Data(bytes: buffer)
  }

  static func triggerApplicationEvents() {
    #if (iOS) || os(tvOS)
    NotificationCenter.default.post(name: UIApplication.didEnterBackgroundNotification, object: nil)
    NotificationCenter.default.post(name: UIApplication.willTerminateNotification, object: nil)
    #elseif os(macOS)
      NotificationCenter.default.post(name: NSApplication.willTerminateNotification, object: nil)
      NotificationCenter.default.post(name: NSApplication.didResignActiveNotification, object: nil)
    #endif
  }
}
