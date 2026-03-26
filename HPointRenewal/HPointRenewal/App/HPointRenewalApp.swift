//
//  HPointRenewalApp.swift
//  HPointRenewal
//
//  Created by 김서진 on 3/26/26.
//

import SwiftUI

@main
struct HPointRenewalApp: App {

    private let container = AppDIContainer()

    var body: some Scene {
        WindowGroup {
            CouponScreen(viewModel: container.makeCouponViewModel())
        }
    }
}
