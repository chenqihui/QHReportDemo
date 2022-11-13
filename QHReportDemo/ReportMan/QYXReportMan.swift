//
//  QYXReport.swift
//  QHReportDemo
//
//  Created by qihuichen on 2022/11/3.
//

import UIKit
import SwiftUI

class QYXReportMan: NSObject {
    class func vc(_ title: String, _ backBlock: @escaping (Int, String) -> ()) -> UIHostingController<QYXReportView> {
        let vc = UIHostingController(rootView: QYXReportView(title: title, backBlock: backBlock))
        return vc
    }
}


struct QYXReportView: View {
    let title: String
    let backBlock: (Int, String) -> ()
    
    @State var data = reportTypeData
    @State var selectIdx = -1
    @State private var msg = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(
                                colors:
                                    [
                                        Color(.sRGB,red: 0x22/255.0, green: 0x1F/255.0, blue: 0x40/255.0),
                                        Color(.sRGB,red: 0x14/255.0, green: 0x1A/255.0, blue: 0x2B/255.0)
                                    ]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                QYXReportTopView {
                    backBlock(-1, "")
                }
                
                QYXReportTypeView(data: data, selectIdx: $selectIdx)
                    .padding(15)
                Spacer(minLength: 24)
                
                HStack(spacing: 0) {
                    Text("内容描述（必填）")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                        .font(.system(size: 18))
                    Spacer()
                }
                .backgroundColor(.clear)
                
                QYXReportContentView(text: $msg)
                    .padding(15)
                    .backgroundColor(.clear)
                
                Button(action: {
                    backBlock(selectIdx, msg)
                }) {
                    Text("举报")
                        .bold()
                        .frame(width:260, height: 50, alignment: .center)
                }
                .foregroundColor(Color.white)
                .background(Color(.sRGB,red: 62/255.0, green: 173/255.0, blue: 247/255.0))
                .clipShape(RoundedRectangle(cornerRadius: 27))
            }
        }
        .gesture(tapAction)
    }
    
    var tapAction: some Gesture {
          TapGesture()
              .onEnded { _ in
                  // Respond to Tap Gesture
              }
      }
}

struct QYXReportView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            QYXReportView(title:"派对的名字名字", backBlock: { idx, msg in
                print("\(idx)-\(msg)")
            })
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
