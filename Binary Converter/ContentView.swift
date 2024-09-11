import SwiftUI

struct ContentView: View {
    @State var number: Int?

    var body: some View {
        VStack {
            TextField("Enter Number to Convert", value: $number, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Text("In Binary that is\n\nUsing Radix : \(String(number ?? 0, radix: 2))\n\nUsing Recursive : \(solver2(num: number ?? 0))\n\nUsing Personal Function : \(solver(num: number ?? 0))")
            
        }
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
    }
}

func solver2(num: Int) -> String {
    if num == 0 {
        return ""
    }
    
    return solver2(num: num / 2) + String(num % 2)
}

func solver(num: Int) -> String {
    var stringNum = ""
    var number = num
    var isEven = num % 2 == 0 ? true : false
    var tempNum = 0
    var powerOfTwoTimes = powerOfTwoTimes(number: num)
    var counterNumber = false 
    
    if !isEven {
        number -= 1 
    }
    
    while powerOfTwoTimes > 0 {
        tempNum = number - closestLowPowerOfTwo(number: number)
        print("temp num\(tempNum)")
        if tempNum > 0 {
            stringNum += "1"
            number -= closestLowPowerOfTwo(number: number)
            powerOfTwoTimes -= 1 
            if tempNum == 1 {
                stringNum += "0"
                number -= 1 
                powerOfTwoTimes -= 1
            }
        } else if tempNum == 0 {
            if pow(2.0, Double(powerOfTwoTimes)) == Double(closestLowPowerOfTwo(number: number)) {
                if !counterNumber { 
                    stringNum += "1"
                    counterNumber = true 
                    number = closestLowPowerOfTwo(number: number)
                    //  print(stringNum)
                } else {
                    stringNum += "0"
                }
            } else {
                stringNum += "0"
            }
            powerOfTwoTimes -= 1
            // print(stringNum)
        } else if num == 0 {
            break
            
        }
        print("number : \(number)")
    }   
    print("string num : \(stringNum)")
    
    // 10 does not work
    return "\(stringNum)" + "\(isEven ? "0" : "1")"
}

func closestLowPowerOfTwo(number: Int) -> Int {
    if number < 3 { 
        return 0
    }
    
    var lowerPower = 1
    while lowerPower * 2 <= number {
        lowerPower *= 2
    }
    print("lower power: \(lowerPower)")
    return lowerPower
}

func powerOfTwoTimes(number: Int) -> Int {
    var count = 0
    var num = number 
    while num > 1 {
        count += 1 
        num /= 2 
    }
    print("power of two count : \(count)")
    return count 
}
