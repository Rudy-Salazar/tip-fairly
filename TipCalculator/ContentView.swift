//
//  ContentView.swift
//  TipCalculator
//
//  Created by Rodolfo Salazar on 7/6/20.
//  Copyright © 2020 Rodolfo Salazar. All rights reserved.
//

import SwiftUI
import Lottie

struct ContentView: View {
    @State var billAmount = ""
    @State var tipPercentage = 2
    
    //Array for the different tip percentages
    let tipPercentages = [10, 15, 20, 25]
    
    //Calculates tip amount
    var totalPercentage: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(billAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        
        return tipValue
    }
    
    var body: some View {
        
        ZStack{
            Color(red: 7 / 255, green: 65 / 255, blue: 124 / 255).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Spacer()
                    .frame(height: -200)
                Text("Tip Fairly")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(red: 216 / 255, green: 239 / 255, blue: 159 / 255))
                        .frame(width: 390 ,height: 150)
                    
                    HStack (spacing: 10){
                        Text("Bill Amount: ")
                            .font(.system(size: 30))
                            .foregroundColor(Color.black)
                            .frame(width: 190, height: 100)
                            .padding([.top, .leading, .bottom], 35)
                        
                        //Text field to enter the bill amount
                        TextField("$100", text: $billAmount)
                            //.foregroundColor(Color.red)
                            .keyboardType(.decimalPad)
                            .font(.system(size: 40))
                            .padding(.leading, -10)
                           
                    }
                }
                    .padding()
                Spacer()
                    .frame(height: -17)
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(red: 216 / 255, green: 239 / 255, blue: 159 / 255))
                            .frame(width: 390 ,height: 150)
                        
                        VStack {
                            Text("Pick the percentage for tip")
                                .foregroundColor(Color.black)
                        
                            //Picker to choose tip percentage amount
                            Section(){
                                Picker("Tip Percentage", selection:
                                $tipPercentage) {
                                    ForEach(0 ..< tipPercentages.count) {
                                        Text("\(self.tipPercentages[$0])%")
                                    }
                                }
                                .padding(.horizontal)
                                .pickerStyle(SegmentedPickerStyle())
                            }
                        }
                    }
                    Spacer()
                        .frame(height: -150)
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(red: 216 / 255, green: 239 / 255, blue: 159 / 255))
                            .frame(width: 390 ,height: 150)
                        
                        //"Money Bag" animation using Lottie
                        HStack {
                            AnimationsView()
                                .frame(width: 250, height: 200)
                                .padding(.leading, -100)
                            
                            //Display calculated tip amount
                        Text("\(totalPercentage, specifier: "%.2f")")
                            .font(.system(size: 50))
                            .foregroundColor(Color.black)
                            .padding(.leading, -100)
                            
                        }
                            
                    }
                }
            }
        }
    }
}

//Struct to use Lottie Animations
struct AnimationsView : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<AnimationsView>) -> AnimationView {
        
        let aniView = AnimationView()
        let animation = Animation.named("MoneyBag", subdirectory: "TestAnimations")
        aniView.loopMode = .loop
        aniView.contentMode = .scaleAspectFit
        aniView.animation = animation
        aniView.play()
        return aniView
    }
    
    func updateUIView(_ uiView: AnimationView, context: UIViewRepresentableContext<AnimationsView>) {
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Blue
//Color(red: 7 / 255, green: 65 / 255, blue: 124 / 255)

//Purple
//Color(red: 101 / 255, green: 65 / 255, blue: 124 / 255)
