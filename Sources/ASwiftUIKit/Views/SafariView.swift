// Created by Augus on 2021/7/31
// Copyright © 2021 Augus <iAugux@gmail.com>

#if os(iOS)
import SafariServices
import SwiftUI

@available(iOS 14.0, *)
public struct SafariView: View {
    let url: URL
    let entersReaderIfAvailable: Bool
    let barCollapsingEnabled: Bool

    public init(url: URL, entersReaderIfAvailable: Bool = false, barCollapsingEnabled: Bool = true) {
        self.url = url
        self.entersReaderIfAvailable = entersReaderIfAvailable
        self.barCollapsingEnabled = barCollapsingEnabled
    }

    public var body: some View {
        _SafariView(url: url, entersReaderIfAvailable: entersReaderIfAvailable, barCollapsingEnabled: barCollapsingEnabled)
            .ignoresSafeArea(edges: .bottom)
    }
}

@available(iOS 14.0, *)
private struct _SafariView: UIViewControllerRepresentable {
    let url: URL
    let entersReaderIfAvailable: Bool
    let barCollapsingEnabled: Bool

    func makeUIViewController(context: Context) -> some UIViewController {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = entersReaderIfAvailable
        config.barCollapsingEnabled = barCollapsingEnabled
        let vc = SFSafariViewController(url: url, configuration: config)
        vc.preferredControlTintColor = UIColor(.accentColor)
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
#endif
