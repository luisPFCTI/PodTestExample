//
//  CustomAppDelegate.swift
//  NHPPSDKEXAMPLE
//
//  Created by Luis Gutiérrez on 2/18/20.
//  Copyright © 2020 Luis Gutiérrez. All rights reserved.
//

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
