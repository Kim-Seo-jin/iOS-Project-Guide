import SwiftUI

struct CouponListView: View {

    let coupons: [CouponEntity]
    let onDownload: (CouponEntity) -> Void

    var body: some View {
        List(coupons) { coupon in
            NavigationLink(value: coupon) {
                CouponRowView(coupon: coupon, onDownload: onDownload)
            }
        }
        .listStyle(.plain)
        .navigationDestination(for: CouponEntity.self) { coupon in
            CouponDetailView(coupon: coupon)
        }
    }
}
