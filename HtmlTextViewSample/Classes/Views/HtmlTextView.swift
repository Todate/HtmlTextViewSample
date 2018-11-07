//
//  HtmlTextView.swift
//  HtmlTextViewSample
//
//  Created by Daisuke Todate on 2018/11/08.
//  Copyright © 2018年 TDT Works. All rights reserved.
//

import UIKit

class HtmlTextView: UITextView {
    
    /// HTML形式の文字列を解析して表示する
    ///
    /// - Parameter sourceText: 変換する文字列
    func setHtml(_ sourceText: String) {
        self.dataDetectorTypes = [.link, .phoneNumber]
        self.attributedText = parseHtmlString(sourceText)
    }
    
    /// HTML形式の文字列をNSAttributedStringに変換する
    ///
    /// - Parameter sourceText: 変換する文字列
    /// - Returns: HTMLドキュメントに変換されたNSAttributedString
    func parseHtmlString(_ sourceText: String) -> NSAttributedString? {
        
        let fontSize = self.font!.pointSize
        let useSystemFontSpanFormat = "<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(fontSize)\">%@</span>"
        let modifiedFont = String(format: useSystemFontSpanFormat, sourceText)
        
        guard let encodeData = modifiedFont.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: encodeData, options: options, documentAttributes: nil) else {
            return nil
        }
        
        return attributedString
    }
    
}
