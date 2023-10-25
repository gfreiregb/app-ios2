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
    
    func testViewModelState() async {
        print("Step 1: \(viewModel.viewState)")
        XCTAssertEqual(viewModel.viewState, .Idle)
        await viewModel.verify()
        print("Step 2: \(viewModel.viewState)")
        XCTAssertEqual(viewModel.viewState, .Loading)
        try! await Task.sleep(for: .seconds(1))
        XCTAssertEqual(viewModel.viewState, .Success)
        print("Step 3: \(viewModel.viewState)")
    }
}
