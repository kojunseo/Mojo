# L6: Overload of Mojo 🔥
# 함수에 입력을 주기 위하 다양한 방법

struct MyFloat:
    var _int: Int
    var _decimal: Float32

    # 서로 다른 방식으로 초기화를 해줄 수 있는데, 타입과 매게변수에 따라 다른 함수가 호출된다.
    # 이를 오버로딩이라고 한다.

    # 1. 매게션수가 하나이면서 타입이 Int인 경우
    fn __init__(inout self, x: Int): 
        self._int = x
        self._decimal = 0.0

    # 2. 매게변수가 하나이면서 타입이 Float32인 경우
    fn __init__(inout self, d: Float32):
        self._int = 0
        self._decimal = d

    # 3. 매게변수가 두개이면서 타입이 Int, Float32인 경우
    fn __init__(inout self, x: Int, d: Float32):
        self._int = x
        self._decimal = d

        
    fn get_output(self) -> Float32:
        return self._int + self._decimal
    # 이전에 설명했듯이 타입을 강하게 체크하기 때문에, 이런식으로 타입체킹을 통해 함수 내에 들어오는 변수의 타입을 강력하게 제어할 수 있게 됨


fn main():
    let x :Int = 10
    let d :Float32 = 0.5
    let myFloat = MyFloat(x)
    print(myFloat.get_output())

    let myFloat2 = MyFloat(d)
    print(myFloat2.get_output())