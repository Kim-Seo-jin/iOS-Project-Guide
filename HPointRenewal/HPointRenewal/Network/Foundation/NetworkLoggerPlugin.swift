import Foundation
import Moya

final class NetworkLoggerPlugin: PluginType {

    func willSend(_ request: RequestType, target: TargetType) {
        #if DEBUG
        guard let urlRequest = request.request else { return }

        let method  = urlRequest.httpMethod ?? "-"
        let url     = urlRequest.url?.absoluteString ?? "-"
        let headers = urlRequest.allHTTPHeaderFields?
            .map { "  \($0.key): \($0.value)" }
            .sorted()
            .joined(separator: "\n") ?? "  (none)"
        let body: String
        if let data = urlRequest.httpBody,
           let json = try? JSONSerialization.jsonObject(with: data),
           let pretty = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
           let str = String(data: pretty, encoding: .utf8) {
            body = str
        } else {
            body = urlRequest.httpBody.flatMap { String(data: $0, encoding: .utf8) } ?? "(empty)"
        }

        hpLog("""
            ┌─ 📤 REQUEST ────────────────────────────
            │ [\(method)] \(url)
            ├─ Headers
            \(headers)
            ├─ Body
            \(body)
            └─────────────────────────────────────────
            """,
            category: .network,
            level: .debug,
            privacy: .private
        )
        #endif
    }

    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        #if DEBUG
        switch result {
        case .success(let response):
            let url        = response.request?.url?.absoluteString ?? "-"
            let statusCode = response.statusCode
            let level: HPointLogLevel = (200..<300).contains(statusCode) ? .info : .error

            let body: String
            if let json = try? JSONSerialization.jsonObject(with: response.data),
               let pretty = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
               let str = String(data: pretty, encoding: .utf8) {
                body = str
            } else {
                body = String(data: response.data, encoding: .utf8) ?? "(empty)"
            }

            hpLog("""
                ┌─ 📥 RESPONSE [\(statusCode)] ──────────────────
                │ \(url)
                ├─ Body
                \(body)
                └─────────────────────────────────────────
                """,
                category: .network,
                level: level,
                privacy: .private
            )

        case .failure(let error):
            hpLog("""
                ┌─ ❌ NETWORK ERROR ──────────────────────
                │ \(error.localizedDescription)
                └─────────────────────────────────────────
                """,
                category: .network,
                level: .error,
                privacy: .public
            )
        }
        #endif
    }
}
