import XCTest
@testable import app_ios2

final class MyViewModelTest: XCTestCase {
    
    var viewModel = MyViewModel()
    
    func testViewModelState() async {
        print("Step 1: \(viewModel.viewState)")
        XCTAssertEqual(viewModel.viewState, .Idle)
        let expectation = XCTestExpectation(description: "verify() was called")
        Task {
            viewModel.verify()
            print("Step 2: \(viewModel.viewState)")
            XCTAssertEqual(viewModel.viewState, .Loading)
            while(viewModel.viewState == .Loading) {}
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 5.0)
        try! await Task.sleep(for: .seconds(1))
        XCTAssertEqual(viewModel.viewState, .Success)
        print("Step 3: \(viewModel.viewState)")
    }
}
