//
//  SVGImgProcessor.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/17/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//
import Kingfisher
import UIKit
import SVGKit

public struct SVGImgProcessor:ImageProcessor {
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
           // print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
