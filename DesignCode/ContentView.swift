//
//  ContentView.swift
//  DesignCode
//
//  Created by Kevin Molina on 27/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State private var offset: CGFloat = 200.0
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
            
                .animation(.default, value: offset)
            
            
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: offset)
            
            
            
            CardView()
                .background(show ? Color.red : Color("background9"))                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15: 0))
            //                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .blendMode(.hardLight)
                .animation(Animation.easeInOut(duration: 0.5), value: offset)
            
            CardView()
                .background(show ? Color.red : Color("background8"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
            //                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .blendMode(.hardLight)
                .animation(Animation.easeOut(duration: 0.5), value: offset)
            
            
            CertificateView()
            
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
            //                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .animation(Animation.spring(), value: offset)
                .onTapGesture {
                    self.show.toggle()
                    offset -= 100.0
                    
                }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Que onda")
        }
        .frame(width: 340.0, height: 220.0)
    }
}

struct CertificateView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Que onda ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    Text("Certificate")
                        .foregroundColor(Color.white)
                }
                Spacer()
                Image("Logo").resizable()
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(.horizontal)
            Spacer()
            Image("Background")
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }
        .padding()
        
        
        
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            
            Rectangle()
                .frame(width: 60, height: 6 )
                .cornerRadius(3.0)
                .opacity(0.1)
            
            Text("Este es un texto algo largo que tiene bastante información")
                .lineLimit(10)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity )
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 580)
    }
}
