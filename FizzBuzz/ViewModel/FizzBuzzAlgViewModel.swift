//
//  FizzBuzzAlgViewModel.swift
//  FizzBuzz
//
//  Created by Gonzalo Olvera Monroy on 17/04/23.
//

import Foundation

class FizzBuzzAlgViewModel: ObservableObject {
    @Published var fizzBuzzModels: [FizzBuzzAlgorithmModel] = []
    
    init() {
        fizzBuzzModels = [
            .init(
                name: "Swift",
                maxConstDef: "let MAX = 100",
                loopWrapper: { code in
                """
                for i in 1..<MAX {
                    \(code)
                }
                """
                },
                printString: { str in
                    #"print("\#(str)\t", terminator: "")"#
                },
                printInt: {#"print("\(i)\t", terminator: "")"#},
                ifStatement: { logic, code in
                    """
                    if \(logic) {
                        \(code.indent())
                        }
                    """
                },
                elseifStatement: { logic, code in
                    """
                    else if \(logic) {
                        \(code)
                        }
                    """
                }, elseStatement: { code in
                    """
                    else {
                        \(code)
                        }
                    """
                }
            ),
            .init(
                name: "C",
                versionNumber: 1.0,
                imports: "#include <stdio.h>",
                boilerWrapper: { code in
                """
                int main() {
                \(code.indent())
                }
                """
                },
                maxConstDef: "#define MAX 100",
                loopWrapper: { code in
                """
                for( int i = 1; i < MAX; i++) {
                    \(code)
                }
                """
                },
                printString: { str in
                    #"printf("\#(str)\t");"#
                },
                printInt: {#"printf("%d\t", i);"#},
                ifStatement: { logic, code in
                    """
                    if (\(logic)) {
                        \(code.indent())
                        }
                    """
                },
                elseifStatement: { logic, code in
                    """
                    else if (\(logic)) {
                        \(code)
                        }
                    """
                }, elseStatement: { code in
                    """
                    else {
                        \(code)
                        }
                    """
                }
            ),
            .init(
                name: "Python",
                commentCode: { code in return #"# "# + code },
                maxConstDef: "MAX = 100",
                loopWrapper: { code in
                """
                for i in range(1,MAX):
                    \(code)
                """
                },
                printString: { str in
                    #"print("\#(str)\t", end = "")"#
                },
                printInt: {#"print(f"{i}\t", end = "")"#},
                ifStatement: { logic, code in
                    """
                    if \(logic):
                        \(code.indent())
                    """
                },
                elseifStatement: { logic, code in
                    """
                    
                        elif \(logic):
                        \(code)
                    """
                }, elseStatement: { code in
                    """
                    
                        else:
                        \(code)
                    """
                }
            ),
            .init(
                name: "Golang",
                commentCode: { code in return #"// "# + code },
                versionNumber: 1.0,
                imports: "package main\n\nimport \"fmt\"\n",
                boilerWrapper: { code in
                """
                func main() {
                \(code.indent())
                }
                """
                },
                maxConstDef: "const MAX = 100",
                loopWrapper: { code in
                """
                for i := 1; i < MAX; i++ {
                    \(code)
                }
                """
                },
                printString: { str in
                    #"fmt.Print("\#(str)\t")"#
                },
                printInt: {#"fmt.Printf("%d\t", i)"#},
                ifStatement: { logic, code in
                    """
                    if (\(logic)) {
                        \(code.indent())
                        }
                    """
                },
                elseifStatement: { logic, code in
                    """
                    else if (\(logic)) {
                        \(code)
                        }
                    """
                }, elseStatement: { code in
                    """
                    else {
                        \(code)
                        }
                    """
                }
            ),
            .init(
                name: "Rust",
                commentCode: { code in return #"// "# + code },
                versionNumber: 1.0,
                imports: "",
                boilerWrapper: { code in
                """
                fn main() {
                \(code.indent())
                }
                """
                },
                maxConstDef: "const MAX: i32 = 100;",
                loopWrapper: { code in
                """
                for i in 1..MAX+1 {
                    \(code)
                }
                """
                },
                printString: { str in
                    #"print!("\#(str)\t");"#
                },
                printInt: {#"print!("{}\t", i);"#},
                ifStatement: { logic, code in
                    """
                    if \(logic) {
                        \(code.indent())
                        }
                    """
                },
                elseifStatement: { logic, code in
                    """
                    else if \(logic) {
                        \(code)
                        }
                    """
                }, elseStatement: { code in
                    """
                    else {
                        \(code)
                        }
                    """
                }
            ),
            .init(
                name: "HTML/JavaScript",
                commentCode: { code in return "<!-- \(code) -->" },
                versionNumber: 0.7,
                imports: "",
                boilerWrapper: { code in
                """
                <h1>Implementation of FuzzBuzz in HTML/Javascript</h1>
                <pre><div id="result">
                
                </div></pre>
                <script>
                document.getElementById('result');
                \(code.indent())
                </script>
                """
                },
                maxConstDef: "var MAX = 100",
                loopWrapper: { code in
                """
                for( var i = 1; i <= MAX; i++) {
                    \(code)
                }
                """
                },
                printString: { str in
                    #"result.innerHTML=result.innerHTML+"\#(str)\t";"#
                },
                printInt: {#"result.innerHTML=result.innerHTML+i+"\t""#},
                ifStatement: { logic, code in
                    """
                    if (\(logic)) {
                        \(code.indent())
                        }
                    """
                },
                elseifStatement: { logic, code in
                    """
                    else if (\(logic)) {
                        \(code)
                        }
                    """
                }, elseStatement: { code in
                    """
                    else {
                        \(code)
                        }
                    """
                }
            )
        ]    }
}
