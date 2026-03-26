import Foundation
import Combine

final class CouponRepository: CouponRepositoryInterface {

    private let service: CouponServiceProtocol

    init(service: CouponServiceProtocol) {
        self.service = service
    }

    // MARK: - Combine
    func fetchCoupons(request: CouponRequestDTO) -> AnyPublisher<[CouponEntity], APIError> {
        service.fetchCouponList(request: request.toRequest())
            .map { $0.coupons.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    // MARK: - async/await
    func fetchCouponsAsync(request: CouponRequestDTO) async throws -> [CouponEntity] {
        let response = try await service.fetchCouponListAsync(request: request.toRequest())
        return response.coupons.map { $0.toDomain() }
    }
}
