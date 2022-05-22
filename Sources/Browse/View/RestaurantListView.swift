//
//  RestaurantListView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI
import Env

struct RestaurantListView: View {
  var restaurantList: RestaurantList
  @EnvironmentObject var env: Env

  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        ForEach(restaurantList) { restaurant in
          env.router.navigate(to: restaurant.url.path) {
            RestaurantCard(restaurant: restaurant)
          }
        }
      }
    }
  }
}

struct RestaurantListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RestaurantListView(restaurantList: [
        Restaurant(
          id: "1",
          imageSrc: "/images/1-burger.jpg",
          name: "Becky's Burgers",
          priceRange: "$$",
          description: "Juicy burgers, crunchy fries, and creamy shakes")
      ])
      .environmentObject(Env.initialize())
    }
  }
}
