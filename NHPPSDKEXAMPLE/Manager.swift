import Foundation

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
        return getActivationToken(customerId: customerId)
    }
    
    private func getActivationToken(customerId: String) -> Bool {
        var isOK = false
            self.activateToken(customerId: customerId, onSuccess: { response in
                if response?.returnCode == "00" {
                    isOK = true
                }
            }, onError: { error in
                if error?.returnCode != "00" {
                    isOK = false
                }
            })
        return isOK
    }
    
    private func activateToken(customerId: String, onSuccess
    successBlock: ((Response?) -> Void)!,
                       onError errorBlock: ((Response?) -> Void)!) {
        let url = URL(string: "https://proxybilletera-cert.pfcti.com/activetoken")!
        var request = URLRequest(url: url)
        request.setValue("584d7d57364049548c2381c7aa651f7d", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        request.setValue("true", forHTTPHeaderField: "Ocp-Apim-Trace")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
                successBlock(Response(requestID: "requestId" ?? "", returnCode: "99" ?? ""))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                fatalError("Error: invalid HTTP response code")
                successBlock(Response(requestID: "requestId" ?? "", returnCode: "00" ?? ""))
            }
            guard let data = data else {
                fatalError("Error: missing response data")
                successBlock(Response(requestID: "requestId" ?? "", returnCode: "00" ?? ""))
            }

            do {
//                let decoder = JSONDecoder()
//                let posts = try decoder.decode([Post].self, from: data)
//                print(posts.map { $0.title })
                print(data)
                successBlock(Response(requestID: "requestId" ?? "", returnCode: "00" ?? ""))
            }
            catch {
                print("Error: \(error.localizedDescription)")
                successBlock(Response(requestID: "requestId" ?? "", returnCode: "99" ?? ""))
            }
        }
        task.resume()
    }
}
