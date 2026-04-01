import SwiftUI

struct CouponListView: View {

    let coupons: [CouponEntity]
    let onDownload: (CouponEntity) -> Void

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(coupons) { coupon in
                    NavigationLink(value: coupon) {
                        CouponRowView(coupon: coupon, onDownload: onDownload)
                            .padding(.horizontal, 16)
                    }
                    .buttonStyle(.plain)

                    Divider()
                        .padding(.leading, 92) // 이미지(64) + spacing(12) + horizontal(16)
                }
            }
        }
        .navigationDestination(for: CouponEntity.self) { coupon in
            CouponDetailView(coupon: coupon)
        }
    }
}
