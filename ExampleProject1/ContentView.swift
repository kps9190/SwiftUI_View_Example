//
//  ContentView.swift
//  ExampleProject1
//
//  Created by ming on 10/29/26.
//

import SwiftUI

struct ContentView: View {
    
    //색상들을 배열로 나열
    var colors: [Color] = [.black, .red, .green, .blue, .orange]
    var colornames = ["검정", "빨강", "초록", "파랑", "오렌지"]
    
    //상태변수 선언 - 글자, 각도, 색상 값
    @State private var rotation: Double = 0
    @State private var text: String = "따라해보기 중"
    @State private var colorIndex = 0
    
    
    // Body안에 View 선언
    var body: some View {
        VStack {
            VStack {
                //간격을 주기
                Spacer()
                //타이틀 글자. 속성을 세게 주기
                Text(text)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(rotation))
                //                이건 iOS15부터 제거된거라 withAnimation을 써야 함.
                //                    .animation(.easeInOut(duration: 0.1))
                    .animation(.easeInOut(duration: 0.1), value: rotation)
                    .foregroundColor(colors[colorIndex])
                Spacer()
                Divider()
                Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                    .padding()
                
                TextField("텍스트를 입력하세요", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Picker(selection: $colorIndex, label: Text("Color")) {
                    ForEach (0 ..< colornames.count, id:\.self) {
                        Text(colornames[$0])
                            .foregroundColor(colors[$0])
                    }
                }
                .pickerStyle(.wheel)
                .padding()
            }
        }
    }
}
    
    #Preview {
        ContentView()
    }
