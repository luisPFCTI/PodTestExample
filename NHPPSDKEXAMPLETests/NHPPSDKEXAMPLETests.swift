import XCTest
@testable import NHPPSDKEXAMPLE

class NHPPSDKEXAMPLETests: XCTestCase {

    var nhppManager: NHPPConnectionManager!
    
    override func setUp() {
        self.nhppManager = NHPPConnectionManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssertNil(nhppManager.activateToken(customerId: "304903007"))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
