import Foundation

enum APIError: Error, LocalizedError {
    case networkError(Error)
    case decodingError(Error)
    case invalidResponse
    case unknown

    var errorDescription: String? {
        switch self {
        case .networkError(let error):  return "네트워크 오류: \(error.localizedDescription)"
        case .decodingError(let error): return "데이터 파싱 오류: \(error.localizedDescription)"
        case .invalidResponse:          return "유효하지 않은 응답"
        case .unknown:                  return "알 수 없는 오류"
        }
    }
}
