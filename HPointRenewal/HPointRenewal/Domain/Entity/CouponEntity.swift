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
