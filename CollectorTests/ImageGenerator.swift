//
//  ImageGenerator.swift
//  CollectorTests
//
//  Created by Albert Gedeon on 11/25/19.
//  Copyright © 2019 Albert Gedeon. All rights reserved.
//

import Foundation
import UIKit

class ImageGenerator{
    static func createTestImage() -> UIImage{
        UIGraphicsBeginImageContext(CGSize(width: 500, height: 500));
        UIColor.green.set();
        UIRectFill(CGRect(x: 0, y: 0, width: 500, height: 500));
        let image = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return image;
    }
}
