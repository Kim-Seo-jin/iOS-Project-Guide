import Foundation

protocol CouponRepositoryInterface {
    func fetchCouponsAsync(request: CouponRequestDTO) async throws -> [CouponEntity]
}

struct CouponRequestDTO {
    let mcustNo: String?
    let copnGbcd: String?
    let prfrYn: String?
    let ptcoId: String?
}
