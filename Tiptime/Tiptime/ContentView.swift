//
//  ContentView.swift
//  Tiptime
//
//  Created by Bart Dority on 8/25/22.
//

import SwiftUI


struct ContentView: View {
    @State var billAmountString = "";
    @State var tipAmountString = "";
    @State var totalAmountString = "";
    
    @State var tipAmount = 0.0;
    @State var billAmount = 0.0;
    @State var totalAmount = 0.0;
    
    var body: some View {
        VStack {
            
            Text("TIP TIME!").font(Font.title.bold())
                .foregroundColor(.black)
                .padding()
            HStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius:15)
                        .fill(Color.white.opacity(0.7))
                        .frame(width: 300, height: 60)
                    
                    TextField("Enter Bill Amount", text: $billAmountString
                             ) {(editing) in
                        print("Editing: \(editing)") } onCommit: {print("commit")}
                        .font(Font.title.bold())
                        .foregroundColor(.black)
                        .frame(width: 280, height: 60)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numbersAndPunctuation)
                       
                }
                Spacer()
            }.padding()
                
            HStack {
                Spacer()
                Button(action: { calculateTip(percentage: 0.10) }) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius:10)
                            .fill(Color.yellow)
                            .frame(width: 70, height: 60)
                        Text("10%").font(Font.title.bold()).foregroundColor(.black)
                    }
                }
                Button(action: {calculateTip(percentage: 0.15) }) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius:10)
                            .fill(Color.cyan)
                            .frame(width: 70, height: 60)
                        Text("15%").font(Font.title.bold()).foregroundColor(.black)
                    }
                }
                Button(action: {calculateTip(percentage: 0.20)}) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius:10)
                            .fill(Color.green)
                            .frame(width: 70, height: 60)
                        Text("20%").font(Font.title.bold()).foregroundColor(.black)
                    }
                }
                Button(action:{ calculateTip(percentage: 0.25)}) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius:10)
                            .fill(Color.purple)
                            .frame(width: 70, height: 60)
                        Text("25%").font(Font.title.bold()).foregroundColor(.black)
                    }
                }
                Spacer()
            }
            Text("The Tip:").font(Font.title.bold())
                .foregroundColor(.black)
                .padding(.top, 34)
            ZStack {
                RoundedRectangle(cornerRadius:15)
                    .fill(Color.white.opacity(0.25))
                    .frame(width: 300, height: 60)
            TextField("...tip amount...", text: $tipAmountString)
                .font(Font.title.bold())
                .foregroundColor(.black)
                .frame(width: 280, height: 20)
                .multilineTextAlignment(.center)
            }
            Text("The Total Amount:").font(Font.title.bold())
                .foregroundColor(.black)
                .padding(.top, 34)
            ZStack {
                RoundedRectangle(cornerRadius:15)
                    .fill(Color.white.opacity(0.25))
                    .frame(width: 300, height: 60)
                TextField("...total....", text: $totalAmountString)
                .font(Font.title.bold())
                .foregroundColor(.black)
                .frame(width: 280, height: 20)
                .multilineTextAlignment(.center)
            }
            Spacer()
           
        }.background(Color.blue)
    }
    func calculateTip(percentage : Double) {

        billAmount = (Double(billAmountString) ?? 0)

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
