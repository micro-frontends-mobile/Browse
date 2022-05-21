import XCTest
@testable import Browse

class BrowseTests: XCTestCase {
  var browse = Browse()

  override func setUpWithError() throws {
    browse.restaurants = [
      Restaurant.init(id: "id", imageSrc: "", name: "name one", priceRange: "$", description: "apple"),
      Restaurant.init(id: "id", imageSrc: "", name: "name two", priceRange: "$$", description: "orange banana"),
      Restaurant.init(id: "id", imageSrc: "", name: "three", priceRange: "$$$", description: "food"),
      Restaurant.init(id: "id", imageSrc: "", name: "four", priceRange: "$$$$", description: "fruit"),
    ]
  }

  override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testCanGetCorrectPriceRanges() throws {
    XCTAssertEqual(["$", "$$", "$$$", "$$$$"], browse.priceRanges)
  }

  func testCanFilterByName() throws {
    browse.setSearchText("name")
    browse.setSelectedPriceRanges([])
    XCTAssertEqual(["name one", "name two"], browse.filteredRestaurants.map { $0.name })
  }

  func testCanFilterByDescription() throws {
    browse.setSearchText("fruit")
    browse.setSelectedPriceRanges([])
    XCTAssertEqual(["four"], browse.filteredRestaurants.map { $0.name })
  }

  func testCanFilterByPriceRange() throws {
    browse.setSearchText("")
    browse.setSelectedPriceRanges(["$$", "$$$"])
    XCTAssertEqual(["name two", "three"], browse.filteredRestaurants.map { $0.name })
  }
}
