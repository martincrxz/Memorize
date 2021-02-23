//
//  ContentView.swift
//  Memorize
//
//  Created by Martín García on 21/02/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.white)
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(lineWidth: 3.0)
            Text("👻")
                .font(Font.largeTitle)
        })
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
