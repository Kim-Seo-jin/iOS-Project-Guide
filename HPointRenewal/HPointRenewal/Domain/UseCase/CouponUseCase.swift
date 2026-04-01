import Foundation

// MARK: - Protocol
protocol CouponUseCaseProtocol {
    func getCouponListAsync(request: CouponRequestDTO) async throws -> [CouponEntity]
}

// MARK: - Implementation
final class CouponUseCase: CouponUseCaseProtocol {

    private let repository: CouponRepositoryInterface

    init(repository: CouponRepositoryInterface) {
        self.repository = repository
    }

    func getCouponListAsync(request: CouponRequestDTO) async throws -> [CouponEntity] {
        try await repository.fetchCouponsAsync(request: request)
    }
}
