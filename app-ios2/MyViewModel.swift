//
//  MyViewModel.swift
//  app-ios2
//
//  Created by Guilherme Galera Fortunato Freire on 24/10/23.
//

//import Foundation
import SwiftUI

@Observable
class MyViewModel {
    var toogleSelection: Bool = false
    var viewState: ViewState = .Idle
    
    func verify() async {
        viewState = .Loading
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
