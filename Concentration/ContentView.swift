//
//  ContentView.swift
//  Concentration
//
//  Created by 百瀬 陽太 on 2023/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var path = NavigationPath()
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack {
                Text("神経衰弱")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                NavigationLink("スタート", value: TransitionPath.play)
            }
            .navigationTitle(TransitionPath.start.rawValue)
            .navigationDestination(for: TransitionPath.self, destination: { appended in
                appended.Destination()
                    .navigationTitle(appended.rawValue)
                
            })
            .padding()
        }
    }
}

///画面遷移の列挙型
enum TransitionPath: String {
    case start = "スタート"
    case play  = "プレイ"

    @ViewBuilder
    func Destination() -> some View {
        switch self {
        case .start: ContentView()
        case .play : PlayView()
        }
    }
}


#Preview {
    ContentView()
}
