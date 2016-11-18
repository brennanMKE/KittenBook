//
//  KittenWrangler.swift
//  KittenBook
//
//  Created by Brennan Stehling on 11/17/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import UIKit

public class KittenWrangler: NSObject {

    public static let sharedInstance = KittenWrangler()

    public func loadKittens(fileURL: URL) -> [Kitten] {
        // load JSON and parse the data
        var kittens: [Kitten] = []

        if let json = loadJSON(path: fileURL.path),
        let dictionary = json as? JSONDictionary,
            let kittensArray = dictionary["kittens"] as? JSONArray {
            for kittenDictionary in kittensArray {
                if let title = kittenDictionary["title"] as? String,
                let caption = kittenDictionary["caption"] as? String,
                    let filename = kittenDictionary["filename"] as? String {
                    let kitten = Kitten(title: title, caption: caption, filename: filename)
                    kittens.append(kitten)
                }
            }
        }

        return kittens
    }

    // MARK: - Private Functions -

    private func loadJSON(path: String) -> Any? {
        let data = loadData(path: path)

        if let data = data {
            return try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        }

        return nil
    }

    private func loadData(path: String) -> Data? {
        if FileManager.default.isReadableFile(atPath: path) {
            guard let data = FileManager.default.contents(atPath: path) else {
                return nil
            }

            return data
        }
        
        return nil
    }

}
