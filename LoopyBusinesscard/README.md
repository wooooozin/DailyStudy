## How to Create Complex Designs and Layouts using SwiftUI
<br>

- Instance Method - edgesIgnoringSafeArea(_:) 
```swift
// 보기의 제안된 영역을 화면의 안전 영역 밖으로 확장하도록 변경합니다.

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(UIColor.systemPink)
                .edgesIgnoringSafeArea(.all)
            Text("Hello, world!")
                .padding()
        }
    }
}
```
<br>

- Color Hex to RGB - https://www.uicolor.io/#/hex-to-ui
```swift
 Color(red: 0.91, green: 0.30, blue: 0.24, opacity: 0.5)
 // swiftUI 에서는 alpha -> opacity
```
<br>

- Instance Method - foregroundColor(_:)
  - Sets the color of the foreground elements displayed by this view.
```swift
 Text("ZanMang Loopy")
                .font(.title)
                .bold()
                .foregroundColor(.white)
```
<br>

- How to Make a Launch Screen in SwiftUI
  - Project → Targets → Info → Custom iOS Target Properties → LaunchScreen
```Text
Background color: 시작 화면 배경색을 설정
Image name: 이미지 크기/해상도로 시작 화면에 이미지를 설정
Image respects safe area insets: 이미지가 화면의 safe area에 충족하거나 초과하도록 허용할지 여부
Show navigation bar: Navigation bar 표시여부
Show Tab bar: Tab bar 표시여부
Show Toolbar: tool bar 표시여부
```
<br>

- SwiftUI info.plist 는 어디로?
```Text
Project → Targets → Info → Custom iOS Target Properties
프로퍼티 추가하면 생성됨
```
<br>

- 커스텀 폰트 추가
```text
1) 다운 받은 글꼴 Target Membership에 유의해 프로젝트 내부로 복사
2) info.plist -> Fonts provided by application 추가 
3) Fonts provided by application -> item에 확장자까지 추가(Pacifico-Regular.ttf)
4) 추가적인 폰트가 있다면 차례대로 추가
```
<br>

- 반복 되는 뷰라면? - Extract Subview 
```swift
1) 원하는 뷰를 커맨트+클릭하면 Extract Subview 생성 가능
2) 새로운 swiftUI 파일을 생성해 반복되는 뷰를 복사해서 이동 또는 새로 생성
3) 필요한 값이 있다면 struct 내부에 상수를 생성해 초기화 할때 값을 넣어 줄 수 있음

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(Color.white)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .frame(width: 20, height: 20, alignment: .leading)
                        .foregroundColor(Color.pink)
                    Text(text)
                        .foregroundColor(Color.black)
                }
            )
            .padding(.all)
    }
}
```
<br>

- Enumeration - previewLayout
  - 필요한 공간만 차지하도록 프리뷰에 지시할 수 있습니다
```swift
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill").previewLayout(.sizeThatFits)
    }
}

case device
미리보기가 실행되고 있는 장치 크기의 컨테이너에서 미리보기를 가운데에 맞춥니다.
case fixed(width: CGFloat, height: CGFloat)
미리보기를 지정된 크기로 고정 크기 컨테이너의 중앙에 놓습니다.
case sizeThatFits
미리보기가 실행되는 장치의 크기가 제공되면 컨테이너를 미리보기 크기에 맞춥니다.
```
<br>

- Instance Method - clipShape(_:style:)
  - 뷰를 제공된 모양으로 자르는 데 사용 합니다. 
    보기에 클리핑 모양을 적용하면 보기의 다른 부분을 제거하면서 모양으로 덮인 보기 부분을 보존할 수 있습니다. 
    클리핑 모양 자체는 표시되지 않습니다.clipShape(_:style:)
```swift
Image("Loopy")
  .resizable()
  .aspectRatio(contentMode: .fill)
  .frame(width: 200.0, height: 200.0, alignment: .center)
  .clipShape(Circle())
  .overlay(
    Circle()
      .stroke(Color(red: 0.91, green: 0.30, blue: 0.24, opacity: 0.5),lineWidth: 5)
   )
```
<br>

- Instance Method - overlay(_:alignment:)
  - 위에 까는 것
  - `overlay`뷰 앞에 레이어 가 있는 뷰입니다.
```swift
Image(systemName: "folder")
    .font(.system(size: 55, weight: .thin))
    .overlay(Text("❤️"), alignment: .bottom)
```
<br>

- Instance Method - resizable(capInsets:resizingMode:)
  - SwiftUI가 공간에 맞게 이미지 크기를 조정하는 모드를 설정합니다.
```swift
Image("Loopy")
	.resizable()
```
<br>

- Instance Method -  padding(_:_:)
  - 이 보기의 특정 가장자리에 동일한 패딩 양을 추가합니다.
  - `edges`: 이 보기에 대해 채울 가장자리 집합입니다. 기본값은 `all`입니다.
  - `length`: 지정된 가장자리에서 이 보기를 채우는 양(포인트)입니다. 
    값을 로 설정하면 `nil`SwiftUI는 플랫폼별 기본 양을 사용합니다. 
    이 매개변수의 기본값은 `nil`입니다.
  ```swift
  func padding(
    _ edges: Edge.Set = .all,
    _ length: CGFloat? = nil
  ) -> some View
  ```
  
  ***
  |## 최종결과물|
  |-----------|
  |<img src = "https://user-images.githubusercontent.com/95316662/183666269-0b9d6d02-9858-47d8-9e08-6b51cc3cfa75.png" width="30%">|
