import XCTest
import Prelude

class FunctorTests: XCTestCase {

  // Helpers

  func double(x: Int) -> Int { return x * 2 }
  func triple(x: Int) -> Int { return x * 3 }

  func show<T: Printable>(t: T) -> String { return t.description }


  // Optional

  func test_it_maps_an_optional_value() {
    let value: Int? = 2
    let result = double <^> value
    XCTAssertNotNil(result)
    XCTAssertEqual(4, result!)
  }

  func test_it_maps_a_nil_value() {
    let value: Int? = nil
    let result = double <^> value
    XCTAssertNil(result)
  }

  func test_it_chains_over_optionals() {
    let result = double <^> triple <^> 10
    XCTAssertNotNil(result)
    XCTAssertEqual(60, result!)
  }


  // Array

  func test_it_maps_an_empty_list() {
    let empty = [Int]()
    let result = double <^> empty
    XCTAssertEqual([], result)
  }

  func test_it_doubles_an_array_of_ints() {
    let ints = Array(1...10)
    let result = double <^> ints
    let expected = Array(stride(from: 2, through: 20, by: 2))
    XCTAssertEqual(expected, result)
  }

  func test_it_chains_over_arrays() {
    let ints = Array(1...10)
    let multipliedBySix = double <^> triple <^> ints
    let expected = Array(stride(from: 6, through: 60, by: 6))
    XCTAssertEqual(expected, multipliedBySix)
  }


  // Dictionary

  func test_it_maps_a_dictionary_of_ints() {
    let singles = [
      "one": 1,
      "two": 2,
      "three": 3,
    ]
    let result = double <^> singles
    let expected = [
      "one": 2,
      "two": 4,
      "three": 6,
    ]
    XCTAssertEqual(expected, result)
  }

  func test_it_maps_an_empty_dictionary() {
    let empty = [String: Int]()
    let result = show <^> empty
    let expected = [String: String]()
    XCTAssertEqual(expected, result)
  }


  // ((->) r)

  func test_fmap_over_function_composes_with_it() {
    let result = double <^> triple
    let expected = double • triple
    XCTAssertEqual(expected(5), result(5))
    XCTAssertEqual(expected(5), 30)
  }

}
