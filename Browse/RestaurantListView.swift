//
//  RestaurantListView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

struct RestaurantListView: View {
  var restaurantList: RestaurantList

  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        ForEach(restaurantList) { restaurant in
          RestaurantCard(restaurant: restaurant)
        }
      }
    }
  }
}

struct RestaurantListView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantListView(restaurantList: [
      Restaurant(
        id: "1",
        imageSrc: "/images/1-burger.jpg",
        name: "Becky's Burgers",
        priceRange: "$$",
        description: "Juicy burgers, crunchy fries, and creamy shakes")
    ])
  }
}
