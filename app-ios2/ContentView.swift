//
//  ContentView.swift
//  app-ios2
//
//  Created by Guilherme Galera Fortunato Freire on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var selected: Bool
    @State var viewModel: MyViewModel = MyViewModel()
    
    init(_ selected: Bool) {
        self.selected = selected
    }
    
    var body: some View {
        if viewModel.viewState == .Idle {
            VStack {
                Spacer()
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, Swift UI!")

                Toggle(isOn: $selected) {
                    Text("Select Toogle")
                }.onChange(of: selected) {
                    Task {
                        await viewModel.verify()
                    }
                    print(selected)
                }

                Spacer()
                SecondView(selection: $selected)
                Spacer()
            }
            .padding()
        } else if viewModel.viewState == .Loading {
            LoadingView()
        } else if viewModel.viewState == .Success {
            SuccesView()
        } else if viewModel.viewState == .Failure {
            FailureView()
        }
    }
}

struct SecondView: View {
    @Binding var selection: Bool
    
    var body: some View {
        HStack {
            Text("Selection is: " + String(selection))
                .onTapGesture {
                    selection = false
                }
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
    }
}

struct SuccesView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailureView: View {
    var body: some View {
        Text("Failure!")
    }
}

func add(numA: Int, numB: Int) {
    numA + numB
}

#Preview {
    ContentView(true)
}
