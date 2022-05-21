//
//  Restaurant.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import Foundation

struct Restaurant: Identifiable, Decodable {
  let id: String
  let imageSrc: String
  let name: String
  let priceRange: String
  let description: String

  var image: URL {
    URL(string: "https://content.demo.microfrontends.com\(imageSrc)")!
  }
}
