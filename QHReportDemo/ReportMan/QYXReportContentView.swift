//
//  QTXReportTextView.swift
//  QHReportDemo
//
//  Created by qihuichen on 2022/11/4.
//

import SwiftUI

struct QYXReportContentView: UIViewRepresentable {
    typealias Context = UIViewRepresentableContext<QYXReportContentView>
    
    @Binding var text: String
    
    let textV = UITextView()
    @State var placeholderTextL = UILabel()
    
    func makeUIView(context: Context) -> UIView {
        let bgV = UIView()
        bgV.backgroundColor = UIColor(red: 0x12/255.0, green: 0x12/255.0, blue: 0x21/255.0, alpha: 1)
        bgV.layer.cornerRadius = 15
        bgV.layer.masksToBounds = true
        
        placeholderTextL.text = "请填写被举报人/派对违规的时间点+违规内容描述，有助于我们快速处理~"
        placeholderTextL.font = UIFont(name: "", size: 14)
        placeholderTextL.textColor = UIColor(red: 0x99/255.0, green: 0x99/255.0, blue: 0x99/255.0, alpha: 1)
        placeholderTextL.isUserInteractionEnabled = false
        placeholderTextL.backgroundColor = .clear
        placeholderTextL.textAlignment = .left
        placeholderTextL.numberOfLines = 0
        
        // [swift UITextView内容距离边框边距设置 - 简书](https://www.jianshu.com/p/847c3da9b15b?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation)
        textV.textContainerInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        textV.delegate = context.coordinator
        textV.isScrollEnabled = true
        textV.font = placeholderTextL.font
        textV.backgroundColor = .clear
        textV.textColor = .white
        textV.returnKeyType = .done
        
        let contentV = UIView()
        contentV.backgroundColor = .clear
        contentV.addSubview(textV)
        contentV.addSubview(placeholderTextL)
        
        let mainV = UIView()
        mainV.addSubview(bgV)
        mainV.addSubview(contentV)
        
        let w = UIScreen.main.bounds.size.width - 30.0
        let h = 175.0
        let mainSize = CGSize(width: w, height: h)
        let off = 15.0
        let contentSize = CGSize(width: w - 2.0 * off, height: h - 2.0 * off)
        mainV.frame.size = mainSize
        bgV.frame = mainV.bounds
        contentV.frame = CGRect(x: off, y: off, width: contentSize.width, height: contentSize.height)
        textV.frame = contentV.bounds
        let s = QYXReportUtil.getTextHeight(textStr: placeholderTextL.text!, font: placeholderTextL.font, width: contentSize.width)
        placeholderTextL.frame = CGRect(origin: textV.contentOffset, size: CGSize(width: contentSize.width, height: s))
        
        return mainV
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, placeholderTextL: placeholderTextL)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        var isEditing: Bool = false
        @State var placeholderTextL: UILabel
        
        init(text: Binding<String>, placeholderTextL: UILabel) {
            self.text = text
            self.placeholderTextL = placeholderTextL
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
            self.placeholderTextL.isHidden = textView.text.count != 0
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            isEditing = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            isEditing = false
        }
        
        // [UITextView 响应 键盘的return（完成键） - 文化流氓 - 博客园](https://www.cnblogs.com/wangxiaorui/p/5387620.html)
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if text == "\n" {
                textView.resignFirstResponder()
            }
            return false
        }
    }
}

// [SwiftUI Preview传递参数问题 - 简书](https://www.jianshu.com/p/bb4543246dc3)
struct QYXReportContentView_Previews: PreviewProvider {
    @State static var msg: String = ""
    static var previews: some View {
        QYXReportContentView(text: $msg)
            .padding()
    }
}
