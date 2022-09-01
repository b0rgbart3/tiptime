//
//  ContentView.swift
//  Tiptime
//
//  Created by Bart Dority on 8/25/22.
//

import SwiftUI
import Swift


struct ContentView: View {
    @State var billAmountString = "0"
    @State var stringValue = ""
    @State var tipAmountString = ""
    @State var totalAmountString = ""
    
    @State var tipAmount = 0.0
    @State var billAmount = 0.0
    @State var totalAmount = 0.0
    @State var decimalEntered = false
    @State var decimalPlaces = 0
    @State var chosenPercentage = 0.0
    @State var calculated = false
    let lightShade = Color(.sRGB, red: 0.44,
                                green: 0.69,
                                blue: 0.85,
                                opacity: 0.5)
    let darkShade = Color(.sRGB, red: 0.29,
                          green: 0.29,
                          blue: 0.38,
                          opacity: 0.5)

    
    var body: some View {
   
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous).foregroundColor(lightShade)
                VStack {
                TextField("", text: $billAmountString)
                    .font(.system(size: 54))
      
                    .foregroundColor(.black)
                    .multilineTextAlignment(.trailing)
                HStack {
                    Text("TIP:").font(.system(size: 36))
                        .foregroundColor(.black)
                       
                    ZStack {
                        TextField("", text: $tipAmountString)
                            .font(.system(size: 42) .bold())
                            .foregroundColor(.black)
                            .multilineTextAlignment(.trailing)
                    }
                }
           
                HStack {
                    ZStack {
                        TextField("", text: $totalAmountString)
                            .font(.system(size: 58) .bold())
                            .foregroundColor(.black)
                            .multilineTextAlignment(.trailing)
                    }
                }
                }.padding()
             
            }.padding()
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous).foregroundColor(darkShade)
                VStack {
                  
                    HStack {
                       
                        Button(action: { pressNumber(value: 7) }) {
                            ZStack {
                                Circle().foregroundColor(.black)
                                    
                                Text("7")
                                    .font(.system(size: 36))
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: { pressNumber(value: 8) }) {
                            ZStack {
                                Circle().foregroundColor(.black)
                                   
                                Text("8")
                                    .font(.system(size: 36))
                                    .foregroundColor(.white)
                            }
                            
                        }
                        Button(action: { pressNumber(value: 9) }) {
                            ZStack {
                                Circle().foregroundColor(.black)
                                  
                                Text("9").font(.system(size: 36))
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: { calculateTip( percentage: 0.1 ) }) {
                            ZStack {
                                if (chosenPercentage == 0.10) {
                                Circle()
                                    .fill(Color.green)
                                    }
                                else {
                                    Circle()
                                        .fill(Color.gray)
                                        
                                }
                                Text("10")
                                    .font(.system(size: 34) .bold())
                                    .foregroundColor(.black)
                            }
                        }
                       
                    }
                    
                    HStack {
                       
                    Button(action: { pressNumber(value: 4) }) {
                    ZStack {
                        Circle().foregroundColor(.black)
                        
                        Text("4")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }}
                    Button(action: { pressNumber(value: 5) }) {
                    ZStack {
                        Circle().foregroundColor(.black)
                
                        Text("5")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }}
                    Button(action: { pressNumber(value: 6) }) {
                    ZStack {
                        Circle().foregroundColor(.black)
                      
                        Text("6").font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                       
                    }
                    Button(action: { calculateTip( percentage: 0.15 ) }) {
                        ZStack {             if (chosenPercentage == 0.15) {
                        Circle()
                            .fill(Color.green)
                            }
                            else {
                                Circle()
                                    .fill(Color.gray)
                                 
                            }
                        Text("15")
                            .font(.system(size: 34) .bold())
                            .foregroundColor(.black)
                    }
                        
                    }
                       
                }
                    HStack {
                    Button(action: { pressNumber(value: 1) }) {
                    ZStack {
                        Circle().foregroundColor(.black)
                         
                        Text("1").font(.system(size: 36))
                            .foregroundColor(.white)
                    }}
                    Button(action: { pressNumber(value: 2) }) {
                    ZStack {
                        Circle().foregroundColor(.black)
                  
                        Text("2").font(.system(size: 36))
                            .foregroundColor(.white)
                    }}
                    Button(action: { pressNumber(value: 3) }) {
                    ZStack {
                        Circle().foregroundColor(.black)
                           
                        Text("3").font(.system(size: 36))
                            .foregroundColor(.white)
                    }}
                    Button(action: { calculateTip( percentage: 0.2 ) }) {
                    ZStack {
                        if (chosenPercentage == 0.20) {
                        Circle()
                            .fill(Color.green)
                             }
                        else {
                            Circle()
                                .fill(Color.gray)
                              
                        }
                        Text("20")
                            .font(.system(size: 34) .bold())
                            .foregroundColor(.black)
                    }}
                    
                }
                    HStack {
                        Button(action: { pressClear() }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                
                                Text("C")
                                    .font(.system(size: 34) .bold())
                                    .foregroundColor(.black)
                            }}
                  
                        Button(action: { pressPeriod() }) {
                        ZStack {
                            Circle().foregroundColor(.black)
                          
                            Text(".").font(.system(size: 36))
                                .foregroundColor(.white)
                        }}
                        Button(action: { pressNumber(value: 0) }) {
                            ZStack {
                                Circle().foregroundColor(.black)
                                
                                Text("0").font(.system(size: 36))
                                    .foregroundColor(.white)
                            }}
                     
                        Button(action: { calculateTip( percentage: 0.25 ) }) {
                        ZStack {
                            if (chosenPercentage == 0.25) {
                            Circle()
                                .fill(Color.green)
                            
                            } else {
                                Circle()
                                    .fill(Color.gray)
                                   
                            }
                            Text("25")
                                .font(.system(size: 34) .bold())
                                .foregroundColor(.black)
                        }}
                        
                    }
                    Spacer()
                }.padding()
            }.padding()
           Spacer()
        }.background(Color.blue)
    }
    
    func pressNumber(value: Int) {
        if (calculated) {
            pressClear()
        }
        if (decimalEntered) {
            decimalPlaces  = decimalPlaces + 1
        }
        if (decimalPlaces < 3) {
        if (billAmount == 0.0) {

            billAmount = Double(value)
            billAmountString = String(value)
        } else {

            stringValue = billAmountString + String(value)
            billAmountString = stringValue
            if let newBill = Double(billAmountString) {
                billAmount = newBill
            }
         
        }}
    }
    func pressPeriod() {
        if (!decimalEntered) {
            decimalEntered = true
     
            stringValue = billAmountString + "."
            billAmountString = stringValue
          
            if let newBill = Double(billAmountString) {
                billAmount = newBill
            }
        }
    }
    func pressClear() {
        billAmount = 0.0
        billAmountString = "0"
        tipAmount = 0.0
        tipAmountString = ""
        totalAmount = 0.0
        totalAmountString = ""
        decimalEntered = false
        decimalPlaces = 0
        calculated = false
        chosenPercentage = 0.0
    }
    
    func calculateTip(percentage : Double) {
        calculated = true
        chosenPercentage = percentage
        if (billAmount > 0) {
            tipAmount = billAmount * percentage;
            tipAmountString = "$ \( String(format: "%0.000002f", tipAmount))"

            
            totalAmount = billAmount + tipAmount;

            totalAmountString = "$ \(String(format: "%0.000002f", totalAmount))"
        }
        return
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
