//
//  QYXReportUtil.swift
//  QHReportDemo
//
//  Created by qihuichen on 2022/11/7.
//

import SwiftUI
import UIKit
import Foundation

extension View {
    func backgroundColor(_ color: Color) -> some View {
        return self.background(color)
    }
}

class QYXReportUtil: NSObject {
    
    class func getTextHeight(textStr :  String, font : UIFont, width : CGFloat)  -> CGFloat {
        let normalText : NSString = textStr as NSString
        let size = CGSize(width: width, height:CGFLOAT_MAX)
        let dic = NSDictionary(object: font, forKey : kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key: Any], context:nil).size
        return  stringSize.height
    }
    
    class func getTextSize(textStr :  String, font : UIFont) -> CGSize {
        let normalText : NSString = textStr as NSString
        let size = CGSize(width: CGFLOAT_MAX, height:CGFLOAT_MAX)
        let dic = NSDictionary(object: font, forKey : kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key: Any], context:nil).size
        return  stringSize
    }
}

