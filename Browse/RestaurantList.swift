//
//  RestaurantList.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import Foundation
import Combine

class RestaurantList: ObservableObject {
  @Published var restaurants: [Restaurant] = []
  var filteredRestaurants: [Restaurant] = []
  private var cancellable = Set<AnyCancellable>()

  func loadData(url: URL) {
    URLSession.shared.dataTaskPublisher(for: url)
      .map { (data: Data, response: URLResponse) in
        print(data)
        return data
      }
      .decode(type: [Restaurant].self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink { _ in
      } receiveValue: { restaurants in
        self.restaurants = restaurants
      }
      .store(in: &cancellable)
  }
}
