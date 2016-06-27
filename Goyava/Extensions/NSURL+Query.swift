//
//  NSURL.swift
//  Goyava
//
//  Created by Susim Samanta on 27/06/16.
//  Copyright © 2016 LordAlexWorks. All rights reserved.
//

import UIKit

extension NSURL {
    func getQueryItemValueForKey(key: String) -> String? {
        guard let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        guard let queryItems = components.queryItems else { return nil }
        return queryItems.filter {
            $0.name == key
            }.first?.value
    }
}