import SwiftUI

@Observable
class MyViewModel {
    var toogleSelection: Bool = false
    var viewState: ViewState = .Idle
    
    func verify() {
        viewState = .Loading
        Task {
            await setRandom()
        }
    }
    
    func setRandom() async {
        try! await Task.sleep(for: .seconds(2))
        var random = Int.random(in: 0...10)
        viewState = {
            if random > 5 {
                ViewState.Success
            } else {
                ViewState.Failure
            }
        }()
    }
}

enum ViewState {
    case Idle
    case Loading
    case Success
    case Failure
}
