//
//  NiceTextView.swift
//  FizzBuzz
//
//  Created by Gonzalo Olvera Monroy on 17/04/23.
//

import SwiftUI

struct NiceTextView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding()
    }
}

struct NiceTextView_Previews: PreviewProvider {
    static var previews: some View {
        NiceTextView(text: "FizzBuzz")
    }
}
