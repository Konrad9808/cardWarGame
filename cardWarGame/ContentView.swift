//
//  ContentView.swift
//  cardWarGame
//
//  Created by Szikszai Konrád on 2021. 02. 17..
//
// 1.Tapping a button
// 2.running the closuere (in bttn action. generate random num)
// 3. Changeing the value in the state property
// 4. state prop referenced in view code it is detecting the data change so re rendering what we see in the UI :)
import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card5"
    @State var cpuCard = "card9"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack {

            Image("background").ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    
                    // generate random number between 2 - 14
                    let playerRand = Int.random(in: 2...14) //method, specify a range with the lower end of the range and the upper end of the range
                    let cpuRand = Int.random(in: 2...14)
                    
                    //update the cards
                    
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    //update the score
                    if playerRand > cpuRand {
                        playerScore += 1
                    }
                    else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                    // if tie we dont want to do anything
                    
                    
                    
                }, label: {
                    Image("dealbutton")
                })
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(Color.red)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore)) //string representation of a number
                            .font(.largeTitle)
                            
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(Color.red)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
