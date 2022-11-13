//
//  QYXReportTypeView.swift
//  QHReportDemo
//
//  Created by qihuichen on 2022/11/3.
//

import SwiftUI
import Foundation

struct QYXReportTypeView: View {
    
    @State var data: [QYXReportType]
    @Binding var selectIdx: Int
    
    var body: some View {
        let n = data.count
        let rows = 3
        let cols = n / rows + n % rows
        
        let size4word = QYXReportUtil.getTextSize(textStr: "陈陈陈陈", font: UIFont.systemFont(ofSize: 13))
        let width = UIScreen.main.bounds.size.width - 30
        let w = width - 12 * 2 - size4word.width * 2
        let ww = w / CGFloat(rows)
        let w1 = ww + size4word.width + 12
        let w2 = ww
        let h1 = 14.0
        
        VStack {
            
            HStack(spacing: 0) {
                Text("举报类型（单选）")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .bold()
                Spacer()
            }
            .padding(.bottom, 15)
            
            ForEach(0 ..< cols, id: \.self) { i in
                HStack(spacing: 0) {
                    ForEach(0 ..< rows, id: \.self) { j in
                        let idx = i * rows + j
                        if idx < n {
                            QYXReportTypeCellView(type:data[idx]) {
                                for i in 0..<n {
                                    if i != idx {
                                        data[i].isSelected = false
                                    }
                                }
                                data[idx].isSelected = true
                                self.selectIdx = idx
                            }
                            .padding(0)
                            .frame(width: j == 2 ? w2 : w1, height: h1, alignment: .leading)
                            .backgroundColor(.clear)
                        }
                    }
                }
                .padding(.bottom, i == rows - 1 ? 0 : 10)
            }
        }
        .backgroundColor(.clear)
    }
}

struct QYXReportTypeCellView: View {
    var type: QYXReportType
    let action: () ->()
    
    var body: some View {
            Button(action: {
                action()
            }) {
                HStack(spacing: 0) {
                    if type.isSelected {
                        Image("qyx_report_on").frame(width: 12, height: 12)
                    }
                    else {
                        Image("qyx_report_off").frame(width: 12, height: 12)
                    }
                    Text(type.name)
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .backgroundColor(.clear)
                        .padding(.leading, 5)
                }
            }
    }
}

struct QYXReportTypeView_Previews: PreviewProvider {
    @State static var data: [QYXReportType] = reportTypeData
    @State static var idx: Int = -1
    static var previews: some View {
        QYXReportTypeView(data: data, selectIdx: $idx)
            .backgroundColor(.black)
            .padding(15)
    }
}

