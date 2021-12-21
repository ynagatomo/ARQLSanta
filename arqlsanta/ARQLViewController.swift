//
//  ARQLViewController.swift
//  arqlsanta
//
//  Created by Yasuhito NAGATOMO on 2021/12/20.
//

import UIKit
import QuickLook
import ARKit

class ARQLViewController: UIViewController, QLPreviewControllerDataSource {
    let assetName = "santaScene"
    let assetType = "reality"
    let allowsContentScaling = true
    let canonicalWebPageURL = URL(string: "https://github.com/ynagatomo/ARQLSanta")

    override func viewDidAppear(_ animated: Bool) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let path = Bundle.main.path(forResource: assetName, ofType: assetType) else {
            fatalError("Couldn't find the supported asset file.")
        }
        let url = URL(fileURLWithPath: path)
        let previewItem = ARQuickLookPreviewItem(fileAt: url)
        previewItem.allowsContentScaling = allowsContentScaling // default = true
        previewItem.canonicalWebPageURL = canonicalWebPageURL   // default = nil
        return previewItem
    }
}

