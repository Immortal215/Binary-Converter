import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab = 1
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                Binary()
                    .tabItem {
                        Image(systemName: "laptopcomputer")
                    }
                    .tag(0)

                Hexa()
                    .tabItem {
                        Image(systemName: "16.square")
                    }
                    .tag(1)
    
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack {
                        TabBarButton(image: "laptopcomputer", index: 0, labelr: "Binary")
                            .padding(.horizontal, 50)
                        TabBarButton(image: "16.square", index: 1, labelr: "Hexa")
                            .padding(.horizontal, 50)
                    
                }
                .padding()
                
            }
        }
        .onAppear {
            selectedTab = 1
        }
        .preferredColorScheme(.dark)
    }
}

struct TabBarButton: View {
    @AppStorage("selectedTab") var selectedTab = 1
    var image: String
    var index: Int
    var labelr: String
    
    var body: some View {
        Button {
            selectedTab = index
        } label: {
        
            VStack {
                Image(systemName: image)
                    .font(.system(size: 24))
                    .rotationEffect(.degrees(selectedTab == index ? 10.0 : 0.0))
                    
                Text(labelr)
                    .font(.caption)
                    .rotationEffect(.degrees(selectedTab == index ? -5.0 : 0.0))
            }
            .offset(y: selectedTab == index ? -10 : 0.0 )
            .foregroundColor(selectedTab == index ? .blue : .gray)
        }
        .shadow(color: .gray, radius: 5)
        .animation(.bouncy(duration: 1, extraBounce: 0.3))
    }
}


