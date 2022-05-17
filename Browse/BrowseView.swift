//
//  BrowseView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

struct BrowseView: View {
  let backgroundColor = Color(uiColor: UIColor(red: 243/255, green: 243/255, blue: 222/255, alpha: 1.0))

  @StateObject private var browseViewModel: BrowseViewModel = BrowseViewModel()
  @State private var searchText: String = ""
  @State private var selectedPriceRanges: [String] = []

  var body: some View {
    VStack {
      SearchSection(searchText: $searchText, selectedPriceRanges: $selectedPriceRanges, priceRanges: browseViewModel.priceRanges)
      RestaurantListView(restaurantList: browseViewModel.filteredRestaurants)
    }
    .background(backgroundColor)
    .onAppear {
      browseViewModel.loadData(url: URL(string: "https://content.demo.microfrontends.com/restaurants.json")!)
    }
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    BrowseView()
  }
}
