//
//  DomainCompletionSource.swift
//  BalarSarYwat
//
//  Created by Aung Ko Min on 25/2/20.
//  Copyright © 2020 Aung Ko Min. All rights reserved.
//

import Foundation
import AutocompleteTextField

class DomainCompletionSource: AutocompleteTextFieldCompletionSource {
    private var topDomains: [String] = {
        let filePath = Bundle.main.path(forResource: "topdomains", ofType: "txt")
        return try! String(contentsOfFile: filePath!).components(separatedBy: "\n")
    }()

    func autocompleteTextFieldCompletionSource(_ autocompleteTextField: AutocompleteTextField, forText text: String) -> String? {
        guard !text.isEmpty else { return nil }

        for domain in self.topDomains {
            if let completion = self.completion(forDomain: domain, withText: text) {
                return completion
            }
        }

        return nil
    }
    private func completion(forDomain domain: String, withText text: String) -> String? {
        let domainWithDotPrefix: String = ".www.\(domain)"
        if let range = domainWithDotPrefix.range(of: ".\(text)", options: .caseInsensitive, range: nil, locale: nil) {
            // We don't actually want to match the top-level domain ("com", "org", etc.) by itself, so
            // so make sure the result includes at least one ".".
            let range = domainWithDotPrefix.index(range.lowerBound, offsetBy: 1)
            let matchedDomain: String = domainWithDotPrefix.substring(from: range)
            if matchedDomain.contains(".") {
                return matchedDomain + "/"
            }
        }

        return nil
    }
}
