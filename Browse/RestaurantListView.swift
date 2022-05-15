//
//  RestaurantListView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

struct RestaurantListView: View {
  let backgroundColor = Color(uiColor: UIColor(red: 243/255, green: 243/255, blue: 222/255, alpha: 1.0))

  @State var restaurants: [Restaurant]

  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        ForEach(restaurants) { restaurant in
          RestaurantCard(restaurant: restaurant)
        }
      }
    }
    .background(backgroundColor)
  }
}

struct RestaurantListView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantListView(restaurants: [
      Restaurant(
        id: "1",
        image: "https://content.demo.microfrontends.com/images/1-burger.jpg",
        name: "Becky's Burgers",
        priceRange: "$$",
        description: "Juicy burgers, crunchy fries, and creamy shakes"),
      Restaurant(
        id: "2",
        image: "https://content.demo.microfrontends.com/images/2-chicken-rice.jpg",
        name: "Chicken Nice",
        priceRange: "$",
        description: "The world's best Hainanese Chicken Rice"),
    ])
  }
}
