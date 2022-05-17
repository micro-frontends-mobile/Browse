//
//  RestaurantList.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import Foundation
import Combine

class BrowseViewModel: ObservableObject {
  @Published var restaurants: RestaurantList = []
  @Published var priceRanges: [String] = []
  private var cancellable = Set<AnyCancellable>()

  var filteredRestaurants: RestaurantList {
    restaurants
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
        self.priceRanges = Array(Set(restaurants.map { $0.priceRange })).sorted()
      }
      .store(in: &cancellable)
  }
}

