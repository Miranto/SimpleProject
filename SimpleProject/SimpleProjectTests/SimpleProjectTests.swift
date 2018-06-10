//
//  SimpleProjectTests.swift
//  SimpleProjectTests
//
//  Created by Mateusz Mirkowski on 07/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import SimpleProject

class PhotosTests: QuickSpec {
  
  let photosViewModel = PhotosViewModel()
  
  override func spec() {
    describe("test PhotosViewModel") {
      beforeEach {
        self.photosViewModel.currentPhotoId = 1
      }
      
      it("setting current photo id", closure: {
        expect(self.photosViewModel.currentPhotoId).to(equal(1))
      })
      
      it("reset current photo id", closure: {
        self.photosViewModel.resetData()
        expect(self.photosViewModel.currentPhotoId).to(equal(0))
      })
      
      it("remove all data", closure: {
        self.photosViewModel.resetData()
        expect(self.photosViewModel.photosData.value.count).to(equal(0))
      })
    }
  }
}
