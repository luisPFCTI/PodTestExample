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
        var res = false
        nhppManager.activateToken(customerId: "304900307", onSuccess: { response in
            res = true
            XCTAssert(res)
        }, onError: { response in
            res = false
            XCTAssert(res)
        }, onFail: { error in
            res = false
            XCTAssert(res)
        })
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
