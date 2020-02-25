import Foundation
import UIKit

open class CustomAppDelegate: UIResponder, UIApplicationDelegate {
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url.absoluteURL)
        print(url.scheme!)
        print(url.host!)
        print(url.path)
        print(url.pathComponents)
        return true
    }
}
