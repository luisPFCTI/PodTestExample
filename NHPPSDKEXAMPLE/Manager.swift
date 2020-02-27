import Foundation

public struct Response: Codable {
    let requestID: String
    let returnCode: String
    init(with dictionary: [String: Any]?) {
        self.requestID = dictionary!["requestID"] as! String
        self.returnCode = dictionary!["returnCode"] as! String
    }
}

enum HTTPError: LocalizedError {
    case statusCode
    case post
}

public class NHPPConnectionManager {
    public init() {}
    public func activateToken(customerId: String,onSuccess successBlock: ((Response) -> Void)!, onError errorBlock: ((Response?) -> Void)!, onFail failBlock: ((String?) -> Void)!)  {
        let data = activateTkn(customerId: customerId)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]
            let response = Response(with: jsonResult!)
            if response.returnCode == "00" {
                successBlock(response)
            } else {
                errorBlock(response)
            }
            debugPrint(response)
        } catch {
            print("Error: \(error.localizedDescription)")
            failBlock(error.localizedDescription)
        }
    }
    
    private func activateTkn(customerId: String) -> Data {
        let url = URL(string: "https://proxybilletera-cert.pfcti.com/activetoken")!
        var request = URLRequest(url: url)
        var dataReceived: Data?
        let semaphore = DispatchSemaphore(value: 0)
        request.httpMethod = "POST"
        request.setValue("584d7d57364049548c2381c7aa651f7d", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        request.setValue("true", forHTTPHeaderField: "Ocp-Apim-Trace")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            defer {
                semaphore.signal()
            }
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
            dataReceived = data
        }
        task.resume()
        semaphore.wait()
        return dataReceived!
    }
}
