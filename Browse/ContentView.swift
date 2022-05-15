//
//  ContentView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    RestaurantListView(restaurantList: RestaurantList())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
