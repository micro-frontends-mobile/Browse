//
//  BrowseView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI
import Env

public struct BrowseView: View {
  @StateObject private var browse: Browse = Browse()
  @State private var searchText: String = ""
  @State private var selectedPriceRanges: [String] = []
  @EnvironmentObject var env: Env

  public init() {}

  public var body: some View {
    VStack {
      SearchSection(searchText: $searchText, selectedPriceRanges: $selectedPriceRanges, priceRanges: browse.priceRanges)
      RestaurantListView(restaurantList: browse.filteredRestaurants)
    }
    .onAppear {
      browse.loadData(url: URL(string: "https://content.demo.microfrontends.com/restaurants.json")!)
    }
    .onChange(of: searchText) { newValue in
      browse.setSearchText(newValue)
    }
    .onChange(of: selectedPriceRanges) { newValue in
      browse.setSelectedPriceRanges(newValue)
    }
    .background(env.configuration.backgroundColor)
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      BrowseView()
        .navigationBarHidden(true)
        .environmentObject(Env.initialize())
    }
  }
}
