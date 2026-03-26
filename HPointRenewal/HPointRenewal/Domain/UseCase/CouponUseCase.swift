import Foundation
import Combine

// MARK: - Protocol
protocol CouponUseCaseProtocol {
    func getCouponList(request: CouponRequestDTO) -> AnyPublisher<[CouponEntity], APIError>
    func getCouponListAsync(request: CouponRequestDTO) async throws -> [CouponEntity]
}

// MARK: - Implementation
final class CouponUseCase: CouponUseCaseProtocol {

    private let repository: CouponRepositoryInterface

    init(repository: CouponRepositoryInterface) {
        self.repository = repository
    }

    func getCouponList(request: CouponRequestDTO) -> AnyPublisher<[CouponEntity], APIError> {
        repository.fetchCoupons(request: request)
    }

    func getCouponListAsync(request: CouponRequestDTO) async throws -> [CouponEntity] {
        try await repository.fetchCouponsAsync(request: request)
    }
}
