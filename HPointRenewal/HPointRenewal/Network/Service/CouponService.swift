import Foundation

// MARK: - Protocol
protocol CouponServiceProtocol {
    func fetchCouponListAsync(request: CouponRequest) async throws -> CouponListResponse
}

// MARK: - Request Model
struct CouponRequest: Encodable {
    let mcustNo: String?
    let copnGbcd: String?
    let prfrYn: String?
    let ptcoId: String?
}

// MARK: - Response Model
struct CouponListResponse: Decodable {
    let code: String
    let message: String
    let coupons: [CouponDTO]

    enum CodingKeys: String, CodingKey {
        case code
        case message
        case coupons = "copnList"
    }
}

struct CouponDTO: Decodable, Hashable {
    let campId: String?
    let ofrId: String?
    let name: String?
    let titleImage: String?
    let copnTypeGbcd: String?

    enum CodingKeys: String, CodingKey {
        case campId
        case ofrId
        case name = "copnNm"
        case titleImage = "copnImgUrl"
        case copnTypeGbcd = "ofrTypeGbcd"
    }
}

// MARK: - Implementation
final class CouponService: BaseService, CouponServiceProtocol {

    func fetchCouponListAsync(request: CouponRequest) async throws -> CouponListResponse {
        try await requestAsync(.fetchCouponList(request: request))
    }
}
