//
//  RestaurantList.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import Foundation
import Combine

class Browse: ObservableObject {
  @Published var restaurants: RestaurantList = []
  var priceRanges: [String] {
    Array(Set(restaurants.map { $0.priceRange })).sorted()
  }
  private var cancellable = Set<AnyCancellable>()
  @Published private var searchText: String = ""
  @Published private var selectedPriceRanges: [String] = []

  var filteredRestaurants: RestaurantList {
    return restaurants
      .filter { searchText == "" ||
        $0.name.lowercased().contains(searchText.lowercased()) ||
        $0.description.lowercased().contains(searchText.lowercased())
      }
      .filter({ selectedPriceRanges.count == 0 || selectedPriceRanges.contains($0.priceRange) })
  }

  func setSearchText(_ searchText: String) {
    self.searchText = searchText
  }

  func setSelectedPriceRanges(_ selectedPriceRanges: [String]) {
    self.selectedPriceRanges =  selectedPriceRanges
  }

  func loadData(url: URL) {
    URLSession.shared.dataTaskPublisher(for: url)
      .map { (data: Data, response: URLResponse) in
        return data
      }
      .decode(type: RestaurantList.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink { _ in
      } receiveValue: { restaurants in
        self.restaurants = restaurants
      }
      .store(in: &cancellable)
  }
}

