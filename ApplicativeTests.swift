import XCTest
import Prelude

class ApplicativeTests: XCTestCase {

  // Optional

  func test_optional_obeys_identity_law() {
    let v: Int? = 1
    let result = pure(identity) <*> v
    XCTAssertNotNil(result)
    XCTAssertEqual(v!, result!)
  }

  func test_optional_obeys_homomorphism_law() {
    let result1 = pure(double) <*> pure(10)
    let result2 = pure(double(10))
    XCTAssertEqual(result1!, result2!)
  }

  func test_optional_obeys_interchange_law() {
    let u = double
    let y = 10
    let result1 = u <*> pure(y)
    let result2 = pure(applicationTo(y)) <*> u
    XCTAssertEqual(result1!, result2!)
  }

}
