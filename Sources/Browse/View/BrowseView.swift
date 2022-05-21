//
//  BrowseView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

public struct BrowseView: View {
  let backgroundColor = Color(uiColor: UIColor(red: 243/255, green: 243/255, blue: 222/255, alpha: 1.0))

  @StateObject private var browse: Browse = Browse()
  @State private var searchText: String = ""
  @State private var selectedPriceRanges: [String] = []

  public init() {}

  public var body: some View {
    VStack {
      SearchSection(searchText: $searchText, selectedPriceRanges: $selectedPriceRanges, priceRanges: browse.priceRanges)
      RestaurantListView(restaurantList: browse.filteredRestaurants)
    }
    .background(backgroundColor)
    .onAppear {
      browse.loadData(url: URL(string: "https://content.demo.microfrontends.com/restaurants.json")!)
    }
    .onChange(of: searchText) { newValue in
      browse.setSearchText(newValue)
    }
    .onChange(of: selectedPriceRanges) { newValue in
      browse.setSelectedPriceRanges(newValue)
    }
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    BrowseView()
  }
}
