//
//  Binary.swift
//  Binary Converter
//
//  Created by Christopher Chang on 9/17/24.
//

import SwiftUI
struct Binary: View {
    @State var int = 0
    @State var test:[Int] = []
    @State var test1 = 0
    @State var answer:Double = 0
    @State var c = 0
    @State var hexa:[Int] = []
    @State var array:[Int] = []
    var body: some View {
        VStack {
            Text("Personal function: \(String(format: "%.0f", answer ))")
            Text("Using Radix: \(String(int, radix: 2))")
            TextField("", value: $int, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width:100)
            Button(action: {
                answer = 0
                c = 0
                test = binary(og: int)
                while true {
                    if test.count >= 0 {
                        answer += pow(10.0, Double(test[c]))
                        c += 1
                    }
                    if c == test.count {
                        answer = answer/10
                        break
                    }
                }
                hexa = hexadecimal(og: int)
//                    while array.count < hexa.max()! {
//                        array.append(0)
//                    }
               
            }, label: {
                Text("Calculate")
                
            })
        }
    }
}

func binary(og:Int) -> [Int] {
    var array: [Int] = []
    var v = og
    while true {
        var x = 1
        var count = 0
            while true {
                x = x*2
                count += 1
                if x > v {
                    array.append(count)
                    x = x/2
                    v = v - x
                    break
                }
            }
        if v <= 1 {
            if v == 1 {
                array.append(1)
            }
            
            break
        }
    }
    return array
}
func hexadecimal(og:Int) -> [Int] {
    var array:[Int] = []
    var v = og
    var answer:[Int] = []
    var c = 0
    while true {
        var x = 1
        var count = 0
        while true {
            x = x*16
            count += 1
            if x > v {
                array.append(count)
                x = x/16
                v = v - x
                break
            }
        }
        if v <= 1 {
            if v == 1 {
                array.append(1)
            }
            break
        }
    }
    while true {
        answer.append(0)
        c += 1
        if c == array.first {
            break
        }
    }
    return array
}
#Preview {
    ContentView()
}
