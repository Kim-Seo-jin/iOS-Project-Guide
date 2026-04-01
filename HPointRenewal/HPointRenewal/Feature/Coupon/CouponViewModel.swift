import Foundation
import Combine

@MainActor
final class CouponViewModel: ObservableObject {

    // MARK: - Published State
    @Published var couponList: [CouponEntity] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showToast = false
    @Published var toastMessage: String?

    private let useCase: CouponUseCaseProtocol

    init(useCase: CouponUseCaseProtocol) {
        self.useCase = useCase
    }

    // MARK: - Data Load
    func load() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        let request = CouponRequestDTO(mcustNo: "", copnGbcd: "01", prfrYn: "N", ptcoId: nil)

        do {
            couponList = try await useCase.getCouponListAsync(request: request)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    // MARK: - Action
    func downloadCoupon(_ coupon: CouponEntity) {
        toastMessage = "\(coupon.name) 쿠폰이 다운로드 되었습니다."
        showToast = true

        Task {
            try? await Task.sleep(for: .seconds(3))
            showToast = false
        }
    }
}
