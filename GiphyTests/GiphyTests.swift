//
//  GiphyTests.swift
//  GiphyTests
//
// Copyright (c) 2014 Ryan Coffman
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN

import Foundation
import XCTest
import Giphy

class GiphyTests: XCTestCase {

	let giphy = Giphy(apiKey: "dc6zaTOxFJmzC")

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {

		super.tearDown()
    }

    func testSearch() {

		let sema = DispatchSemaphore(value: 0)

		giphy.search("fun", limit: 1, offset: nil, rating: nil) {

			XCTAssert($2 == nil, $2?.localizedDescription ?? "")
			XCTAssert($0!.count == 1, "Results weren't one")
			sema.signal()
		}

		sema.wait(timeout: DispatchTime.distantFuture)
    }

	func testGif() {

		let sema = DispatchSemaphore(value: 0)

		giphy.gif("1") { (gif, err) -> Void in
			print(err == nil)
			XCTAssert(true, "NOTTET")
			XCTAssert(err == nil, err?.localizedDescription ?? "")
			XCTAssert(gif != nil, "Gif is nil")
			sema.signal()
		}

		sema.wait(timeout: DispatchTime.distantFuture)
	}

	func testGifs() {

		let sema = DispatchSemaphore(value: 0)

		giphy.gifs(["1","12cAJO8mkO3hUA","hLaUjPEPBbRxm"]) { (gifs, err) -> Void in

			XCTAssert(err == nil, err?.localizedDescription ?? "")
			XCTAssert(gifs != nil, "Gif is nil")
			XCTAssert(gifs!.count == 3, "")
			sema.signal()
		}

		sema.wait(timeout: DispatchTime.distantFuture)
	}

	func testTranslate() {

		let sema = DispatchSemaphore(value: 0)

		giphy.translate("cat", rating: nil) { (gif, err) -> Void in

			XCTAssert(err == nil, err?.localizedDescription ?? "")
			XCTAssert(gif != nil, "Gif is nil")
			sema.signal()
		}

		sema.wait(timeout: DispatchTime.distantFuture)
	}

	func testRandom() {

		let sema = DispatchSemaphore(value: 0)

		giphy.random(nil, rating: nil) {

			XCTAssert($1 == nil, $1?.localizedDescription ?? "")
			XCTAssert($0 != nil, "Gif was nil")
			sema.signal()
		}

		sema.wait(timeout: DispatchTime.distantFuture)
	}

	func testTrending() {

		let sema = DispatchSemaphore(value: 0)

        giphy.trending(10, offset: 0, rating: nil) {

			XCTAssert($2 == nil, $2?.localizedDescription ?? "")
			XCTAssert($0 != nil, "Gifs is nil")
			XCTAssert($0!.count == 10, "Gifs count is wrong")
			sema.signal()
		}

		sema.wait(timeout: DispatchTime.distantFuture)
	}
}
