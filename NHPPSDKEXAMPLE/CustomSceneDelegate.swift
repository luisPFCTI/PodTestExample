import Foundation
import UIKit

@available(iOS 13.0, *)
open class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    open func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for context in URLContexts {
            if (context.url.host == "openApp2") {
                deeplinker.handleDeeplink(url: context.url)
            }
        }
    }
}


