//
//  QYXReportTopView.swift
//  QHReportDemo
//
//  Created by qihuichen on 2022/11/3.
//

import SwiftUI

struct QYXReportTopView: View {
    
    let backBlock: () ->()
    
    var body: some View {
        let w = UIScreen.main.bounds.width
        ZStack {
            HStack {
                Button(action: {
                    backBlock()
                }) {
                    Image("qyx_report_back").padding(.leading ,15)
                }
                Spacer()
            }
            Text("举报“派对的名字名字”")
                .foregroundColor(.white)
                .font(.system(size: 18))
                .bold()
        }
        .frame(width: w, height: 50)
    }
}

struct QYXReportTopView_Previews: PreviewProvider {
    static var previews: some View {
        QYXReportTopView(backBlock: {
            
        }).backgroundColor(.black)
    }
}
