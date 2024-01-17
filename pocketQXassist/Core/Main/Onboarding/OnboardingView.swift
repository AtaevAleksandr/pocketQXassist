//
//  OnboardingView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 15.01.2024.
//

import SwiftUI
import UserNotifications
import StoreKit
import AppTrackingTransparency

struct OnboardingView: View {
    @AppStorage("isAlredyOnboarding") var isAlredyOnboarding: Bool = false
    //    @AppStorage("isNotificationPermissionGranted") var isNotificationPermissionGranted: Bool = false

    @State private var onboardingState: Int = 0
    @State private var notificationAuthorization: Bool = false

    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))

    var body: some View {
        ZStack {
            BackgroundView()

            switch onboardingState {
            case 0: WelcomeView()
                    .transition(transition)
            case 1: NotificationsView()
                    .transition(transition)
            case 2: DemoPairsView()
                    .transition(transition)
            case 3: DemoRateAppView()
                    .transition(transition)
            case 4: DemoScaleOfPairs()
                    .transition(transition)
            default: BackgroundView()
            }

            VStack {
                Spacer()
                bottomButton
            }
        }
    }
}

//MARK: COMPONENTS
extension OnboardingView {
    private var bottomButton: some View {
        Button {
            handleContinuedButtonPressed()
        } label: {
            Text(onboardingState == 1 || onboardingState == 3 ? "Show" : "Continue")
                .font(.callout)
                .foregroundStyle(.black)
                .frame(height: 53)
                .frame(maxWidth: .infinity)
                .background(Color.theme.customOrange)
                .cornerRadius(10)
                .animation(nil, value: UUID())
                .padding()
        }
    }
}

// MARK: FUNCTIONS
extension OnboardingView {

    private func handleContinuedButtonPressed() {
        if onboardingState == 0 {
            requestTrackingAuthorization()
        } else if onboardingState == 1 {
            requestAuthorization()
        } else if onboardingState == 3 {
            requestReview()
        } else if onboardingState == 4 {
            goToTabBarView()
        } else {
            withAnimation(.spring()) {
                self.onboardingState += 1
            }
        }
    }

    private func requestTrackingAuthorization() {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                withAnimation(.spring()) {
                    self.onboardingState += 1
                }
            case .denied:
                withAnimation(.spring()) {
                    self.onboardingState += 1
                }
            case .notDetermined:
                break
            case .restricted:
                break
            @unknown default:
                break
            }
        }
    }

    private func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if success {
                //                self.isNotificationPermissionGranted = true
                withAnimation(.spring()) {
                    self.onboardingState += 1
                }
            } else {
                withAnimation(.spring()) {
                    self.onboardingState += 1
                }
            }

            if let error = error {
                print ("ERROR: \(error)")
            }
        }
    }

    private func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
            withAnimation(.spring()) {
                self.onboardingState += 1
            }
        }
    }

    private func goToTabBarView() {
        isAlredyOnboarding = true
    }
}




#Preview {
    OnboardingView()
}
