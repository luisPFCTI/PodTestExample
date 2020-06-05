import Foundation
import UIKit

open class CustomAppDelegate: UIResponder, UIApplicationDelegate {
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (url.host! == "openApp2") {
               return deeplinker.handleDeeplink(url: url)
        }
        return true
    }
}
