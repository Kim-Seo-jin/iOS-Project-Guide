import Foundation

final class AppDIContainer {

    // MARK: - Network
    private lazy var couponService: CouponServiceProtocol = CouponService()

    // MARK: - Repository
    private lazy var couponRepository: CouponRepositoryInterface =
        CouponRepository(service: couponService)

    // MARK: - UseCase
    private lazy var couponUseCase: CouponUseCaseProtocol =
        CouponUseCase(repository: couponRepository)

    // MARK: - ViewModel Factory
    @MainActor
    func makeCouponViewModel() -> CouponViewModel {
        CouponViewModel(useCase: couponUseCase)
    }
}
