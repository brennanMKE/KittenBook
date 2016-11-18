//
//  Application.swift
//  KittenBook
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import Foundation
import KittenBookKit

public class Application: NSObject {

    public static let current = Application()

    public var loggedIn: Bool {
        get {
            if loginOverrideEnabled {
                return true
            }
            return false
        }
    }

    public var kittens: [Kitten] {
        get {
            let bundle = Bundle(for: self.classForCoder)
            guard let path = bundle.path(forResource: "kittens", ofType: "json"),
                let fileURL = URL(string: path) else {
                    return []
            }

            let kittens = KittenWrangler.sharedInstance.loadKittens(fileURL: fileURL)
            return kittens
        }
    }

    // MARK: - Private Properties & Functions -

    private var loginOverrideEnabled: Bool {
        get {
            if let loginOverrideEnabled =  ProcessInfo.processInfo.environment["LoginOverrideEnabled"],
                convertBool(string: loginOverrideEnabled) == true {
                return true
            }

            return false
        }
    }

    private func convertBool(string: String) -> Bool? {
        let lc = string.lowercased()
        if let boolValue = Bool(lc) {
            return boolValue
        }
        else if string == "0" || lc == "no" {
            return false
        }
        else if string == "1" || lc == "yes" {
            return true
        }
        else {
            return nil
        }
    }

}
