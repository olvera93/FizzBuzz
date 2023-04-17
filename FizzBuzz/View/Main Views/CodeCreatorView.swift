//
//  CodeCreatorView.swift
//  FizzBuzz
//
//  Created by Gonzalo Olvera Monroy on 17/04/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct CodeCreatorView: View {
    
    @StateObject var fizzBuzzAlgViewModel: FizzBuzzAlgViewModel = FizzBuzzAlgViewModel()
    
    var body: some View {
        NavigationStack {
            List(fizzBuzzAlgViewModel.fizzBuzzModels) { item in
                NavigationLink(item.name) {
                    ZStack {
                        Color
                            .gray
                            .opacity(0.3)
                            .ignoresSafeArea()
                        
                        ScrollView {
                            VStack {
                                Text(item.actualFizzBuzzCode)
                                    .font(.headline)
                                    .padding()
                                    .minimumScaleFactor(0.1)
                                    .contextMenu {
                                        Button(action: {
                                            UIPasteboard
                                                .general
                                                .string = item.actualFizzBuzzCode
                                        }) {
                                        Text("Copy to clipboard")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Fizz Buzz")
        }
    }
}

struct CodeCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        CodeCreatorView()
    }
}
