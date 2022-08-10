## Designing a Layout using Spacers and Subviews
- Structure - Spacer
  - 포함하는 스택 레이아웃의 주요 축을 따라 확장되거나 
    스택에 포함되지 않은 경우 두 축 모두에서 확장되는 유연한 공간입니다.
    ```swift
    struct ChecklistRow: View {
    let name: String

    var body: some View {
        HStack {
            Image(systemName: "checkmark")
            Spacer()
            Text(name)
             }
        .border(Color.blue)
        }
    }
    ```
    <br>

## Building in Functionality and Managing State

  - property wrappers [참고사이트](https://wwwhackingwithswift.com/quick-start/swiftui/all-swiftui-property-wrappers-explained-and-compared)
  -  @State private var isPlaying: Bool = false
  ```swift
  struct ContentView: View {
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(number: leftDiceNumber)
                    DiceView(number: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button {
                    leftDiceNumber = Int.random(in: 1...6)
                    rightDiceNumber = Int.random(in: 1...6)
                } label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(.red)
                .padding(.vertical)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let number: Int
    
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

  ```
