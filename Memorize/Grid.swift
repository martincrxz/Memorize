//
//  GridView.swift
//  Memorize
//
//  Created by Martín García on 02/03/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var itemView: (Item) -> ItemView
    
    init(_ items: [Item], itemView: @escaping (Item) -> ItemView) {
        self.items = items
        self.itemView = itemView
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item,in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return self.itemView(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}
