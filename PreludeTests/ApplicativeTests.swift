import XCTest
import Prelude

class ApplicativeTests: XCTestCase {

  // Optional

  func test_optional_obeys_identity_law() {
    let v: Int? = 1
    let result = pure(id) <*> v
    XCTAssertNotNil(result)
    XCTAssertEqual(v!, result!)
  }

  func test_optional_obeys_homomorphism_law() {
    let result1: Int? = pure(double) <*> pure(10)
    let result2: Int? = pure(double(10))
    XCTAssertEqual(result1!, result2!)
  }

  func test_optional_obeys_interchange_law() {
    let u = double
    let y = 10
    let result1 = u <*> pure(y)
    let result2 = pure(applicationTo(y)) <*> u
    XCTAssertEqual(result1!, result2!)
  }

  func test_optional_obeys_composition_law() {
    let u = Optional.Some(double),
        v = Optional.Some(triple),
        w = Optional.Some(10)
    let result1 = u <*> (v <*> w)
    let result2 = pure(curry(•)) <*> u <*> v <*> w
    XCTAssertEqual(60, result1!)
    XCTAssertEqual(result1!, result2!)
  }


  // Array

  func test_it_applies_a_list_of_functions_to_a_single_value() {
    let result = curry(+) <§> [2,3,4] <*> pure(4)
    XCTAssertEqual([6,7,8], result)
  }

  func test_it_collects_results_from_functions_applied_to_multiple_values() {
    let result = curry(+) <§> [5,10] <*> [1,2]
    XCTAssertEqual([6,7,11,12], result)
  }

}
