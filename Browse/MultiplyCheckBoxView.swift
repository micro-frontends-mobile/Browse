//
//  CheckBoxView.swift
//  Browse
//
//  Created by Dongdong Zhang on 2022/5/15.
//

import SwiftUI

struct MultiplyCheckBoxView<Item: StringProtocol>: View {
  var values: [Item]
  @Binding var selectedValues: [Item]
  @State private var toggles: [Bool] = []

  var body: some View {
    HStack {
      HStack {
        ForEach(toggles.indices, id: \.self) { index in
          HStack {
            Text("\(self.values[index].description)")
            CheckBoxView(checked: $toggles[index])
          }
        }
      }
    }
    .onAppear(perform: {
      self.toggles = Array<Bool>(repeating: false, count: values.count)
    })
    .onChange(of: values, perform: { newValue in
      self.toggles = Array<Bool>(repeating: false, count: newValue.count)
    })
    .onChange(of: toggles) { newToggles in
      var selectedValues = Array<Item>(repeating: "", count: values.count)
      newToggles.indices.forEach { index in
        if newToggles[index] {
          selectedValues[index] = values[index]
        }
      }
      self.selectedValues = selectedValues.filter({ $0 != "" })
    }
  }
}

struct MultiplyCheckBoxView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
  }

  struct PreviewView: View {
    let values = ["$", "$$", "$$$", "$$$$", "$$$$$", "$$$$$$", "$$$$$$$$"]
    @State var selectedValues: [String] = []
    var body: some View {
      VStack(alignment: .leading) {
        Text("selectedValues: \(selectedValues.joined(separator: ","))")
        MultiplyCheckBoxView<String>(values: values, selectedValues: $selectedValues)
      }
    }
  }
}

struct CheckBoxView: View {
  @Binding var checked: Bool

  var body: some View {
    Image(systemName: checked ? "checkmark.square.fill" : "square")
      .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
      .onTapGesture {
        self.checked.toggle()
      }
  }
}

struct CheckBoxView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      CheckBoxView(checked: .constant(false))
      CheckBoxView(checked: .constant(true))
    }
  }
}
