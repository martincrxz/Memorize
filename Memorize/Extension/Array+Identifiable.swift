//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Martín García on 02/03/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if matching.id == self[index].id {
                return index
            }
        }
        return nil
    }
}
