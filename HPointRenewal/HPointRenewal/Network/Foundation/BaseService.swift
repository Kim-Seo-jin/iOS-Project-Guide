import Foundation
import Moya

class BaseService {

    let provider: MoyaProvider<HPointAPI>

    init(provider: MoyaProvider<HPointAPI> = MoyaProvider<HPointAPI>(plugins: [NetworkLoggerPlugin()])) {
        self.provider = provider
    }

    // MARK: - async/await
    func requestAsync<T: Decodable>(_ target: HPointAPI) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            provider.request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let decoded = try response.map(T.self)
                        continuation.resume(returning: decoded)
                    } catch {
                        continuation.resume(throwing: APIError.decodingError(error))
                    }
                case .failure(let error):
                    continuation.resume(throwing: APIError.networkError(error))
                }
            }
        }
    }
}
