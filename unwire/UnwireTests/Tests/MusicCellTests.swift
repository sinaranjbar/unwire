//
//  MusicCellTests.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
@testable import Unwire
import XCTest

class MusicCellTests: XCTestCase {
    var sut: MusicCell!
    
    override func setUp() {
        super.setUp()
        sut = MusicCell.fromNib(named: String(describing: MusicCell.self))
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_cellHasArtwork(){
        XCTAssertNotNil(sut.artworkInageView)
    }
    
    func test_loadItemInCell(){
        sut.configureCellWith(.example,
                              imageCacheService: nil)
        XCTAssertEqual(sut.releaseDateLabel.text, "2018-08-31T12:00:00Z")
        XCTAssertEqual(sut.trackNameLabel.text, "Fall")
        XCTAssertEqual(sut.collectionNameLabel.text, "Kamikaze - Eminem")
    }
}
