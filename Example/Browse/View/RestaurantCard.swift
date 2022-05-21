//
//  RestaurantCard.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

struct RestaurantCard: View {
  @State var restaurant: Restaurant

  var body: some View {
    VStack(spacing: 0) {
      AsyncImage(url: restaurant.image) { image in
        image.resizable()
      } placeholder: {
        ProgressView()
      }
      .frame(height: 260)

      VStack(alignment: .leading, spacing: 8) {
        HStack {
          Text("\(restaurant.name)")
          Spacer()
          Text("\(restaurant.priceRange)")
        }
        .font(.title)
        Text("\(restaurant.description)")
          .font(.subheadline)
      }
      .padding()
    }
    .background(.background)
  }
}

struct RestaurantCard_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantCard(restaurant: Restaurant(
      id: "1",
      imageSrc: "/images/1-burger.jpg",
      name: "Becky's Burgers",
      priceRange: "$$",
      description: "Juicy burgers, crunchy fries, and creamy shakes"))
  }
}
