import SwiftUI

struct ContentView: View {
    @State private var flag = true
    @State private var mass = 1.0
    @State private var stiffness = 104.0
    @State private var damping = 10.0
    @State private var initialVelocity = 5.0
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack {
                ZStack {
                    Color.white.opacity(0.2)
                        
                    ZStack {
                        Color(.white)
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 33, style: .continuous))
                    .offset(x: 0, y: flag ? -100 : 100)
                }.onTapGesture() {
                    withAnimation(.interpolatingSpring(mass: mass, stiffness: stiffness, damping: damping, initialVelocity: initialVelocity)) {
                        flag.toggle()
                    }
                }.clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                    .padding()
                
                
                VStack() {
                    VStack(alignment: .leading) {
                        
                        Text("Mass: \(Int(mass))")
                            .foregroundColor(.white)
                        Slider(
                            value: $mass,
                            in: 0...20
                        )
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("Stiffness: \(Int(stiffness))")
                            .foregroundColor(.white)
                        Slider(
                            value: $stiffness,
                            in: 0...1000
                        )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Damping \(Int(damping))")
                            .foregroundColor(.white)
                        Slider(
                            value: $damping,
                            in: 0...100
                        )
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Initial Velocity \(Int(initialVelocity))")
                            .foregroundColor(.white)
                        Slider(
                            value: $initialVelocity,
                            in: 0...100
                        )
                    }
                    
                }.padding(20)
                
                
            }
        }
    }
}
