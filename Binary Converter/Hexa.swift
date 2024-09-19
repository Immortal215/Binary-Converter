
import SwiftUI
struct Hexa: View {
    @State var hexaString = ""
    @State var decimal: Int = 17
    var body: some View {
        VStack {
            Text("Hexadecimal")
                .font(.largeTitle)
            Form {
                Section("Enter Hexadecimal") {
                    TextField("Enter Hexadecimal to convert", text: $hexaString)
                        .onChange(of: hexaString) {
                            hexaString = hexaString.uppercased()
                        }
                    
                    Text("Returned Decimal : ")
                    
                }
                
                Section("Enter Decimal") {
                    TextField("Enter Decimal to convert", value: $decimal, format: .number)
                    Text("Returned Hexadecimal : \(hexadecimal(og: decimal ?? 0))")
                }
                
                
            }
            
        }
        
    }
}

func hexadecimal(og:Int) -> String {
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
    
    // array = [2,2,2,2,1,1,1]
    //array.count(1)
    // var array2 = []
    //array2.append(arrayCount(array: array, num: Int))
    
    var endString = ""
    let array2 = arrayCount(array: array)
    let hexaDic = [10 : "A", 11 : "B", 12 : "C", 13 : "D", 14 : "E", 15 : "F"]
    
    for i in array2 {
        if i > 9 {
            endString += String(hexaDic[i]!)
        } else {
            endString += String(i)
        }
    }
    print("array \(array)")
    return endString
}

func arrayCount(array: Array<Int>) -> Array<Int> {
    var count = 0
    var valuer = array.max()!
    var arrayAnswer: [Int] = []
    
    for (index, value) in array.enumerated() {
        print("count \(count)")
        print("index \(index)")
        print("array count \(array.count)")
        if valuer > value {
            valuer = value
            arrayAnswer.append(count)
            if (index + 1) == array.count {
                count += 1
                arrayAnswer.append(count)
            }
            count = 0
        } else if valuer == value {
            count += 1
        }
    }
    print("Array Answer \(arrayAnswer)")
    return arrayAnswer
}
