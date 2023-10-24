//
//  app_ios2Tests.swift
//  app-ios2Tests
//
//  Created by Guilherme Galera Fortunato Freire on 23/10/23.
//

import XCTest
@testable import app_ios2

final class MyViewModelTest: XCTestCase {
    
    var viewModel = MyViewModel()
    
    func testViewModelState() {
        assert(1 + 1 == 3)
//        async {
//            await viewModel.verify()
//            assert(viewModel.viewState == .Success)
//        }
    }
}
