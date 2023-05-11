//
//  XCTestCase+AwaitPublisher.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
import XCTest
import Combine

extension XCTestCase {
    func awaitPublisher<T: Publisher>(_ publisher: T,
                                      timeout: TimeInterval = 5,
                                      file: StaticString = #file,
                                      line: UInt = #line) throws -> T.Output {
        var result: Result<T.Output, Error>?
        let expectation = self.expectation(description: "Awaiting publisher")
        
        let cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result = .failure(error)
                case .finished:
                    break
                }
            },
            receiveValue: { value in
                result = .success(value)
                expectation.fulfill()
            }
        )
        
        waitForExpectations(timeout: timeout)
        cancellable.cancel()
        
        let unwrappedResult = try XCTUnwrap(
            result,
            "Awaited publisher did not produce any output",
            file: file,
            line: line
        )
        
        return try unwrappedResult.get()
    }
}
