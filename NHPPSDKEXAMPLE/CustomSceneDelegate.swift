//
//  CustomSceneDelegate.swift
//  NHPPSDKEXAMPLE
//
//  Created by Luis Gutiérrez on 2/18/20.
//  Copyright © 2020 Luis Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for context in URLContexts {
            print("url: \(context.url.absoluteURL)")
            print("scheme: \(context.url.scheme)")
            print("host: \(context.url.host)")
            print("path: \(context.url.path)")
            print("components: \(context.url.pathComponents)")
        }
    }
}

