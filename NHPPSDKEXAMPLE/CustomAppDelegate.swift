import Foundation
import UIKit

open class CustomAppDelegate: UIResponder, UIApplicationDelegate {
    var window2: UIWindow?
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (url.host! == "openApp2") {
               return Deeplinker.handleDeeplink(url: url)
//            let sb = UIStoryboard(name: "Login", bundle: .main)
//            let loginVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as LoginViewController
//            window2?.rootViewController = loginVC
        }
        return true
    }
}
