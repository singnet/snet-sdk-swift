//
//  PaidCallPaymentStrategy.swift
//  snet-sdk-swift
//
//  Created by Jagan Kumar Mudila on 23/04/2021.
//

import Foundation
import BigInt
import PromiseKit

class PaidCallPaymentStrategy: BasePaidPaymentStrategy {
    
    func getPaymentMetadata() -> Promise<[[String : Any]]> {
        return firstly {
            self._selectChannel()
        }.then { (channel) -> Promise<[[String : Any]]> in
            return Promise { metadatapromise in
                guard let currentSignedAmount = channel.state["currentSignedAmount"],
                      let nonce = channel.state["nonce"] else {
                    let genericError = NSError(
                        domain: "snet-sdk",
                        code: 0,
                        userInfo: [NSLocalizedDescriptionKey: "Unable to get organization metadata"])
                    metadatapromise.reject(genericError)
                    return }
                
                let amount = currentSignedAmount + self._getPrice()
                
                let signature = self._generateSignature(channelId: channel.channelId, nonce: nonce, amount: amount)
                
                let metadata = [["snet-payment-type": "escrow"],
                                ["snet-payment-channel-id": channel.channelId],
                                ["snet-payment-channel-nonce": "\(nonce)" ],
                                ["snet-payment-channel-amount": amount ],
                                ["snet-payment-channel-signature-bin": signature ]]
                metadatapromise.fulfill(metadata)
            }
        }
    }
    
    func _generateSignature(channelId: String, nonce: BigUInt, amount: BigUInt) -> String {
        
        let hexString = "__MPE_claim_message".tohexString()
            + self._serviceClient.mpeContract.address!.hex(eip55: false) // Address field
            + String(BigUInt(stringLiteral: channelId), radix: 16).paddingLeft(toLength: 64, withPad: "0")
            + String(nonce, radix: 16).paddingLeft(toLength: 64, withPad: "0")
            + String(amount, radix: 16).paddingLeft(toLength: 64, withPad: "0")
        
        return self._serviceClient.sign(dataToSign: hexString)
    }
    
    func _getPrice() -> BigUInt {
        self._serviceClient._pricePerServiceCall
    }
}
