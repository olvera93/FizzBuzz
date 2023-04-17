//
//  String Extensions.swift
//  FizzBuzz
//
//  Created by Gonzalo Olvera Monroy on 17/04/23.
//

import Foundation

extension String {
    func indent() -> String {
        var result = ""
        let listOfLines = self.split(separator: "\n")
        listOfLines.forEach { line in
            result += "\t\(line)\n"
        }
        
        return String(result.dropLast())
    }
}
