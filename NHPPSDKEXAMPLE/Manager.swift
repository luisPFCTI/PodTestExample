import Foundation
import Alamofire

public class Response {
    var requestID: String
    var returnCode: String
    init(requestID: String, returnCode: String) {
        self.requestID = requestID
        self.returnCode = returnCode
    }
}


class NHPPConnectionManager {
    public func activateToken(customerId: String) -> Bool {
        var activatedToken = false
        self.activateToken(customerId: customerId, onSuccess: { response in
            if response?.returnCode == "00" {
                activatedToken = true
            }
        }, onError: { error in
            if error?.returnCode != "00" {
                activatedToken = false
            }
        })
        return activatedToken
    }
    
    private func activateToken(customerId: String, onSuccess
    successBlock: ((Response?) -> Void)!,
                       onError errorBlock: ((Response?) -> Void)!) {
        let headers: HTTPHeaders = [.contentType("application/json"),
                                    .init(name: "Ocp-Apim-Subscription-Key", value: "584d7d57364049548c2381c7aa651f7d"),
                                    .init(name: "Ocp-Apim-Trace", value: "true")
                                    ]
        let parameters = [
            "requestID": "4",
            "institutionCode": "HST",
            "tokenRefID": "DNITHE381502386342002358",
            "activationCode": "0153632",
            "operatorID": "14",
            "reason": "Token activation pending",
            "clientId": customerId
        ]
        var requestId: String?
        var returnCode: String?
        AF.request("https://proxybilletera-cert.pfcti.com/activetoken",method: .post, parameters: parameters, headers: headers).responseJSON(completionHandler: { response in
            debugPrint(response)
            print("holalucho")
            debugPrint("holalucho")
            switch response.result {
            case .success(let data):
                let dictionary = data as! NSDictionary
                requestId = dictionary.value(forKey: "requestID") as? String
                returnCode = dictionary.value(forKey: "returnCode") as? String
                let response = Response(requestID: requestId ?? "", returnCode: returnCode ?? "")
                successBlock(response)
            case .failure(let error):
                requestId = "403"
                returnCode = error.localizedDescription
                let response = Response(requestID: requestId ?? "", returnCode: returnCode ?? "")
                errorBlock(response)
            }
        })
    }
}
