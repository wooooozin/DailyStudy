- SwiftUI
```Text
  - SwiftUI는 뷰를 구현할 수 있도록 만든 프레임워크
  - iOS13 부터 지원
  - 최소한의 코드만으로 Swift의 성능을 사용하여 모든 Apple 플랫폼에서 사용할 수 있는 앱을 만들 수 있다.
  - 기존의 UIKit 보다 간단하고 쉽게 뷰를 구성할 수 있다.
```

- SwiftUI 특징 - [출처](https://developer.apple.com/kr/xcode/swiftui/)
```
1. 선언형
2. 자동화
3. 조합
4. 데이터 업데이트 최신화
```

- ContentView

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

// 사용자 인터페이스의 모양과 작동 방식을 정의하는 것
```

- ContentView_Previews
```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 미리보기가 어떻게 생성되어야 하고 작동되어야 하는지 정의
// 프리뷰 - 미리보기 같은 개념, 실제로 앱을 빌드할 때는 사용되지 않음
```

- ContentView_Previews 기기 변경하기
```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView().previewDevice("iPhone 8")   // 원하는 기기 기입
    }
 }
```
