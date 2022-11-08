import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ListTapViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.listTapElements, id: \.id) { element in
                    Button {
                        vm.performRandomAction(index: vm.listTapElements.firstIndex(of: element)!)
                    } label: {
                        HStack {
                            Circle().foregroundColor(element.color)
                                .frame(width: 50, height: 50)
                                .padding()
                            Text(String(element.number))
                        }
                    }
                }
            }
            .listStyle(.plain)
         
            Button {
                vm.timerIsActive.toggle()
            } label: {
                Text(vm.timerIsActive ? "STOP": "START")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 50)
            .background(vm.timerIsActive ? Color.red : Color.green)
            .cornerRadius(10)
            .padding(.bottom, 50)
            .buttonStyle(.plain)
        }
        .onReceive(vm.timer) { _ in
            if vm.timerIsActive {
                vm.performActionOnTimer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
