//
//  RestaurantListView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

struct RestaurantListView: View {
  let backgroundColor = Color(uiColor: UIColor(red: 243/255, green: 243/255, blue: 222/255, alpha: 1.0))

  @ObservedObject var restaurantList: RestaurantList

  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        ForEach(restaurantList.restaurants) { restaurant in
          RestaurantCard(restaurant: restaurant)
        }
      }
    }
    .background(backgroundColor)
    .onAppear {
      restaurantList.loadData(url: URL(string: "https://content.demo.microfrontends.com/restaurants.json")!)
    }
  }
}

struct RestaurantListView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantListView(restaurantList: RestaurantList())
  }
}
