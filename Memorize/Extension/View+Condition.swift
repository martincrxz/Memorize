//
//  View+Condition.swift
//  Memorize
//
//  Created by Martín García on 06/03/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
