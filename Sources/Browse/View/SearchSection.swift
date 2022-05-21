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
  @State var clear: Bool = false
  var priceRanges: [String]
  var body: some View {
    HStack {
      VStack {
        HStack {
          Text("Search:")
            .font(.headline)
          TextField("Search", text: $searchText)
        }
        HStack {
          Text("Price range:")
            .font(.headline)
          MultiplyCheckBoxView<String>(values: priceRanges, selectedValues: $selectedPriceRanges, clear: $clear)

          Spacer()
        }
      }

      Button {
        searchText = ""
        selectedPriceRanges = []
        clear.toggle()
      } label: {
        Text("Clear")
      }

    }
    .padding()
  }
}

struct SearchSection_Previews: PreviewProvider {
  static var previews: some View {
    Preview()
  }

  struct Preview: View {
    @State var searchText: String = ""
    @State var selectedPriceRanges: [String] = []

    var body: some View {
      SearchSection(searchText: $searchText,
                    selectedPriceRanges: $selectedPriceRanges,
                    priceRanges: ["$", "$$", "$$$", "$$$$"])
    }
  }
}
