import SwiftUI

struct ContentView: View {
    @State var int = 0
    @State var test:[Int] = []
    @State var test1 = 0
    @State var answer:Double = 0
    @State var c = 1
    @State var subAnswer:Double = 0
    @State var number : Int?
    var body: some View {
        
        VStack {
            Text("Binary")
                .font(.largeTitle)
                .fontDesign(.monospaced)
                .padding()
            TextField("Enter Number to Convert", value: $number, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Text("In Binary that is\n\nUsing Radix : \(String(number ?? 0, radix: 2))\n\nUsing Recursive : \(solver2(number: number ?? 0))")
                .multilineTextAlignment(.center)
            Text(String(format: "%.0f", answer + subAnswer))
            TextField("", value: $int, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width:100)
            Button(action: {
                answer = 0
                subAnswer = 0
                c = 1
                test = binary(og: int)
                answer = pow(10.0, Double(test[0]))
                while true {
                    if test.count > 1 {
                        subAnswer += pow(10.0, Double(test[c]))
                        c += 1
                    }
                    if c == test.count {
                        subAnswer = subAnswer/10
                        break
                    }
                }
            }, label: {
                Text("Calculate")
                
            })
        }
    }
}
func binary(og:Int) -> Array<Int>{
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
            array[0] = array[0] - 1
            
            break
        }
    }
    return array
}
//func secondBinary(og:Int, count: Int ) -> Int {
//
func solver2(number: Int) -> String {
    if number == 0 {
        return ""
    }
    return "\(solver2(number: number/2))\(number % 2)"
}
