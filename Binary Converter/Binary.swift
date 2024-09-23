import SwiftUI
struct Binary: View {
    @State var int = 0
    @State var test:[Int] = []
    @State var answer:Double = 0
    @State var c = 0
    @State var binar = ""
    @State var answer2:[Int] = []
    @State var bi:Double = 0
    
    var body: some View {
        VStack {
            Text("Binary")
                .padding()
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

//                    while array.count < hexa.max()! {
//                        array.append(0)
//                    }

               
            }, label: {
                Text("Calculate")
                
            })
            Text("Decimal")
                .padding()
            Text("Personal function: \(String(format: "%.0f", answer2 ))")
            Text("Radix: \(Int(binar, radix: 2) ?? 0)")
            TextField("", text: $binar)
                .textFieldStyle(.roundedBorder)
                .frame(width:100)
            Button {
                bi = 0
                c = 0
                
//                answer2 = binaryConvert(og: binar)
//                while true {
//                    if answer2.count >= 0 {
//                        bi += pow(2.0, Double(answer2[c]))
//                        c += 1
//                        if c == test.count {
//                            break
//                        }
//                    }
//                }
                
                
                
            } label: {
                Text("Calculate")
            }

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

func binaryConvert(og:Int) -> [Int] {
    
    var count = og
    
  //  var answer:Double = 0
    var array:[Int] = []
    // 1001 = 9
    // 10001 = 17
    while count > 0 {
        var count2:Double = 0
        var placeHold = 0
        while placeHold <= count {
            count2 += 1
            placeHold = Int(pow(10.0, count2))
        }
        array.append(Int(count2 - 1))
        count = count - placeHold/10
    }
    
    
    return array
}
      

#Preview {
    ContentView()
}
