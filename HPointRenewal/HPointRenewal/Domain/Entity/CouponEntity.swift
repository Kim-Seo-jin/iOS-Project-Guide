import Foundation

struct CouponEntity: Identifiable, Hashable {
    let id: String
    let campId: String
    let ofrId: String
    let name: String
    let titleImage: String?
    let couponType: CouponType

    var isCampaignCoupon: Bool {
        !campId.isEmpty
    }

    enum CouponType: String {
        case coupon     = "01"
        case pluspoint  = "02"
        case unknown
    }
}

// MARK: - Mock
extension CouponEntity {
    static let mock = CouponEntity(
        id: "mock-001",
        campId: "CAMP001",
        ofrId: "OFR001",
        name: "스타벅스 아메리카노 무료쿠폰",
        titleImage: nil,
        couponType: .coupon
    )

    static let mockList: [CouponEntity] = [
        CouponEntity(id: "1", campId: "C001", ofrId: "O001", name: "스타벅스 아메리카노 무료쿠폰", titleImage: nil, couponType: .coupon),
        CouponEntity(id: "2", campId: "C002", ofrId: "O002", name: "CU 편의점 3,000원 할인", titleImage: nil, couponType: .coupon),
        CouponEntity(id: "3", campId: "",     ofrId: "O003", name: "H포인트 2배 적립", titleImage: nil, couponType: .pluspoint),
        CouponEntity(id: "4", campId: "C004", ofrId: "O004", name: "현대백화점 10% 할인", titleImage: nil, couponType: .coupon),
        CouponEntity(id: "5", campId: "",     ofrId: "O005", name: "주유소 리터당 100원 할인", titleImage: nil, couponType: .coupon)
    ]
}
