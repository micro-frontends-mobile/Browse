//
//  SearchSection.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

struct SearchSection: View {
  @Binding var searchText: String
  @Binding var selectedPriceRanges: [String]
  var priceRanges: [String]
  var body: some View {
    VStack {
      HStack {
        Text("Search:")
          .font(.headline)
        TextField("Search", text: $searchText)
      }
      HStack {
        Text("Price range:")
          .font(.headline)
        MultiplyCheckBoxView<String>(values: priceRanges, selectedValues: $selectedPriceRanges)

        Spacer()
      }
    }
    .padding()
  }
}

struct SearchSection_Previews: PreviewProvider {
  static var previews: some View {
    SearchSection(searchText: .constant("search"),
                  selectedPriceRanges: .constant([]),
                  priceRanges: ["$", "$$", "$$$", "$$$$"])
  }
}
