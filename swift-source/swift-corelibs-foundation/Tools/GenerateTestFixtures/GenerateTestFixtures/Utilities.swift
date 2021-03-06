// This source file is part of the Swift.org open source project
//
// Copyright (c) 2019 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors

// This is the same as the .unwrapped() method used in TestFoundation, but does not invoke XCTFail.

enum TestError: Error {
    case unexpectedNil
}

extension Optional {
    // Same signature as the original.
    func unwrapped(_ fn: String = #function, file: StaticString = #file, line: UInt = #line) throws -> Wrapped {
        if let x = self {
            return x
        } else {
            throw TestError.unexpectedNil
        }
    }
}

func swiftVersionString() -> String {
    #if compiler(>=5.0) && compiler(<5.1)
        return "5.0"  // We support 5.0 or later.
    #elseif compiler(>=5.1)
        return "5.1"
    #endif
}
