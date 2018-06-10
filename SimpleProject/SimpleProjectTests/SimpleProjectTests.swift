//
//  SimpleProjectTests.swift
//  SimpleProjectTests
//
//  Created by Mateusz Mirkowski on 07/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import XCTest
@testable import SimpleProject

class SimpleProjectTests: XCTestCase {
  
  let photosViewModel = PhotosViewModel()
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    photosViewModel.currentPhotoId = 1
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testSettingCurrentPhotoId() {
    XCTAssertEqual(photosViewModel.currentPhotoId, 1)
  }
  
  func testResetCurrentPhotoId() {
    photosViewModel.resetData()
    XCTAssertEqual(photosViewModel.currentPhotoId, 0)
  }
  
  func testResetPhotoData() {
    photosViewModel.resetData()
    XCTAssertEqual(photosViewModel.photosData.value.count, 0)
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}

