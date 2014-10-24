import XCTest
import Prelude

class FunctorTests: XCTestCase {

  // Optional

  func test_it_maps_an_optional_value() {
    let value: Int? = 2
    let result = fmap(double, value)
    XCTAssertNotNil(result)
    XCTAssertEqual(4, result!)
  }

  func test_it_maps_a_nil_value() {
    let value: Int? = nil
    let result = fmap(double, value)
    XCTAssertNil(result)
  }

  func test_it_chains_over_optionals() {
    let result = fmap(double, fmap(triple, 10))
    XCTAssertNotNil(result)
    XCTAssertEqual(60, result!)
  }

  func test_optional_obeys_the_identity_functor_law() {
    let value: Int? = 10
    let result = fmap(id, value)
    XCTAssertNotNil(result)
    XCTAssertEqual(10, result!)
  }

  func test_optional_obeys_the_composition_functor_law() {
    let value: Int? = 10
    let result1 = fmap(double • triple, value)
    let result2 = curry(fmap)(double) • curry(fmap)(triple) § value
    XCTAssertEqual(result1!, result2!)
  }


  // Array

  func test_it_maps_an_empty_list() {
    let empty = [Int]()
    let result = fmap(double, empty)
    XCTAssertEqual([], result)
  }

  func test_it_doubles_an_array_of_ints() {
    let ints = Array(1...10)
    let result = fmap(double, ints)
    let expected = Array(stride(from: 2, through: 20, by: 2))
    XCTAssertEqual(expected, result)
  }

  func test_it_chains_over_arrays() {
    let ints = Array(1...10)
    let multipliedBySix = fmap(double, fmap(triple, ints))
    let expected = Array(stride(from: 6, through: 60, by: 6))
    XCTAssertEqual(expected, multipliedBySix)
  }

  func test_array_obeys_the_identity_functor_law() {
    let ints = Array(1...10)
    let result = fmap(id, ints)
    let expected = Array(1...10)
    XCTAssertEqual(expected, result)
  }

  func test_array_obeys_the_composition_functor_law() {
    let ints = Array(1...10)
    let result1 = fmap(double • triple, ints)
    let result2 = curry(fmap)(double) • curry(fmap)(triple) § ints
    XCTAssertEqual(result1, result2)
  }


  // Dictionary

  let singles = [ "one": 1, "two": 2, "three": 3 ]
  let doubles = [ "one": 2, "two": 4, "three": 6 ]

  func test_it_maps_a_dictionary_of_ints() {
    let result = fmap(double, singles)
    XCTAssertEqual(doubles, result)
  }

  func test_it_maps_an_empty_dictionary() {
    let empty = [String: Int]()
    let result = fmap(show, empty)
    let expected = [String: String]()
    XCTAssertEqual(expected, result)
  }

  func test_dictionary_obeys_the_identity_functor_law() {
    let result = fmap(id, singles)
    XCTAssertEqual(singles, result)
  }

  func test_dictionary_obeys_the_composition_functor_law() {
    let result1 = fmap(double • triple, singles)
    let result2 = curry(fmap)(double) • curry(fmap)(triple) § singles
    XCTAssertEqual(result1, result2)
  }


  // ((->) r)

  func test_fmap_over_function_composes_with_it() {
    let result = fmap(double, triple)
    let expected = double • triple
    XCTAssertEqual(expected(5), result(5))
    XCTAssertEqual(expected(5), 30)
  }

  func test_functions_obey_identity_functor_law() {
    let result = fmap(id, square)
    XCTAssertEqual(square(2), result(2))
  }

  func test_functions_obey_composition_functor_law() {
    let result1 = fmap(double • triple, square)
    let result2 = curry(fmap)(double) • curry(fmap)(triple) § square
    XCTAssertEqual(150, result1(5))
    XCTAssertEqual(result1(5), result2(5))
  }

}
