import XCTest
import PromiseKit
@testable import snet_sdk_swift

final class snet_sdk_swiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual("Hello, World!", "Hello, World!")
    }
    
//    func testOrgsList() {
//            let config = SDKConfig(web3Provider: "https://mainnet.infura.io/v3/63b3cc74dd3f42b19212b25ca27178b8", privateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", signerPrivateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", networkId: "1")
//            let sdk = SnetSDK(config: config)
//            let ex = expectation(description: "")
//        let orgsList = sdk.getOrgsList()
//            orgsList.done { (data) in
//                XCTAssertTrue(data.count > 0)
//                ex.fulfill()
//            }
//            wait(for: [ex], timeout: 10)
//        }
//
        func testSDKInstance() {
            let config = SDKConfig(web3Provider: "https://ropsten.infura.io/v3/63b3cc74dd3f42b19212b25ca27178b8", privateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", signerPrivateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", networkId: "3")
            let sdk = SnetSDK(config: config)
            let ex = expectation(description: "")
            let client = sdk.createServiceClient(orgId: "19545b757a754564bd005546e3118308", serviceId: "r2_test")
            client.done { (data) in
                XCTAssertNil(data.metadata)
                ex.fulfill()
            }.catch { (error) in
                print(error)
                XCTAssertNil(error)
                ex.fulfill()
            }
            wait(for: [ex], timeout: 20)
        }
//
//    func testMPEContract() {
//        let config = SDKConfig(web3Provider: "https://ropsten.infura.io/v3/63b3cc74dd3f42b19212b25ca27178b8", privateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", signerPrivateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", networkId: "3")
//        let sdk = SnetSDK(config: config)
//        let ex = expectation(description: "")
//        let orgsList = sdk.getOrgsList()
//        orgsList.done { (data) in
//            XCTAssertTrue(data.count > 0)
//            ex.fulfill()
//        }
//        wait(for: [ex], timeout: 10)
//    }
//
//    func testAccountBalance() {
//        let config = SDKConfig(web3Provider: "https://ropsten.infura.io/v3/63b3cc74dd3f42b19212b25ca27178b8", privateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", signerPrivateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", networkId: "3")
//        let sdk = SnetSDK(config: config)
//        let ex = expectation(description: "")
//        let accountBalance = sdk.accountBalance()
//        accountBalance.done { (balance) in
//            XCTAssertTrue(balance.count > 0)
//            ex.fulfill()
//        }
//        wait(for: [ex], timeout: 10)
//    }
//
//    func testAccountAllowance() {
//        let config = SDKConfig(web3Provider: "https://ropsten.infura.io/v3/63b3cc74dd3f42b19212b25ca27178b8", privateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", signerPrivateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", networkId: "3")
//        let sdk = SnetSDK(config: config)
//        let ex = expectation(description: "")
//        let accountBalance = sdk.accountAllowance()
//        accountBalance.done { (allowance) in
//            XCTAssertTrue(allowance.count > 0)
//            ex.fulfill()
//        }
//        wait(for: [ex], timeout: 10)
//    }
//
//    func testOpenChannel() {
//        let config = SDKConfig(web3Provider: "https://ropsten.infura.io/v3/63b3cc74dd3f42b19212b25ca27178b8", privateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", signerPrivateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", networkId: "3")
//        let sdk = SnetSDK(config: config)
//        let ex = expectation(description: "")
//        let accountBalance = sdk.openChannel()
//        accountBalance.done { (channel) in
//            XCTAssertNil(channel)
//            ex.fulfill()
//        }.catch { (error) in
//            print(error)
//            ex.fulfill()
//        }
//        wait(for: [ex], timeout: 20)
//    }
//    
//    func testSignData() {
//        let config = SDKConfig(web3Provider: "https://ropsten.infura.io/v3/63b3cc74dd3f42b19212b25ca27178b8", privateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", signerPrivateKey: "2c10268f3bb86682b99258d163bb7d7b94afbc73ba84c3d2b795f0181fdfb237", networkId: "3")
//        let sdk = SnetSDK(config: config)
//        let ex = expectation(description: "")
//        sdk.signData()
//
//        wait(for: [ex], timeout: 20)
//    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
