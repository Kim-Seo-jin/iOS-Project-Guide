import Foundation

final class CouponRepository: CouponRepositoryInterface {

    private let service: CouponServiceProtocol

    init(service: CouponServiceProtocol) {
        self.service = service
    }

    func fetchCouponsAsync(request: CouponRequestDTO) async throws -> [CouponEntity] {
        let response = try await service.fetchCouponListAsync(request: request.toRequest())
        return response.coupons.map { $0.toDomain() }
    }
}
