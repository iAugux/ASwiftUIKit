// Created by Augus on 6/27/23
// Copyright © 2023 Augus <iAugux@gmail.com>

#if os(iOS)
import SwiftUI

@available(iOS 14.0, *)
public struct ActivityView: View {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    public init(activityItems: [Any], applicationActivities: [UIActivity]? = nil) {
        self.activityItems = activityItems
        self.applicationActivities = applicationActivities
    }

    public var body: some View {
        if #available(iOS 17.0, *) {
            // if ignore bottom safe area, there will be a glitch on top navigation bar.
            _ActivityView(activityItems: activityItems, applicationActivities: applicationActivities)
        } else {
            _ActivityView(activityItems: activityItems, applicationActivities: applicationActivities)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

@available(iOS 14.0, *)
private struct _ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]?

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
#endif
