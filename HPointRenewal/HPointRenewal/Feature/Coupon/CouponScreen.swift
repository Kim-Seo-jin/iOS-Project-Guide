import SwiftUI

struct CouponScreen: View {

    @StateObject var viewModel: CouponViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundStyle(.secondary)
                        .padding()
                } else {
                    CouponListView(
                        coupons: viewModel.couponList,
                        onDownload: { viewModel.downloadCoupon($0) }
                    )
                }

                if viewModel.showToast {
                    VStack {
                        Spacer()
                        Text(viewModel.toastMessage ?? "")
                            .padding()
                            .background(.black.opacity(0.75))
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                            .padding(.bottom, 32)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.easeInOut, value: viewModel.showToast)
                }
            }
            .navigationTitle("쿠폰")
            .task {
                // async/await 방식으로 로드
                await viewModel.loadWithAsync()
            }
        }
    }
}
