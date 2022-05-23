//
//  ContentView.swift
//  BrowseExample
//
//  Created by Dongdong Zhang on 2022/5/21.
//

import SwiftUI
import Browse
import Env

struct ContentView: View {
  var body: some View {
    NavigationView {
      BrowseView()
        .navigationBarHidden(true)
        .environmentObject(Env.initialize(router: MyRouter() as Router))
    }
  }
}

class MyRouter: Router {
  public override init() {}
  public override func navigate<Source>(to: String, source: () -> Source) -> AnyView where Source : View {
    AnyView(NavigationLink {
      Text("From Content \(to)")
    } label: {
      source()
        .foregroundColor(.primary)
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(Env.initialize(router: MyRouter() as Router))
  }
}
