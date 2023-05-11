//
//  URLSessionDataTaskMock.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
@testable import Unwire

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
