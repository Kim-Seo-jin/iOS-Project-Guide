import Foundation
import Combine

protocol CouponRepositoryInterface {
    // Combine
    func fetchCoupons(request: CouponRequestDTO) -> AnyPublisher<[CouponEntity], APIError>
    // async/await
    func fetchCouponsAsync(request: CouponRequestDTO) async throws -> [CouponEntity]
}

struct CouponRequestDTO {
    let mcustNo: String?
    let copnGbcd: String?
    let prfrYn: String?
    let ptcoId: String?
}
