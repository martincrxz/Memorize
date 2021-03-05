//
//  Array+Only.swift
//  Memorize
//
//  Created by Martín García on 04/03/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
