# L3: Mojo static struct (similar to class in python)🔥
# Struct와 class의 차이점1:
# : 파이썬의 class는 동적으로, runtime중에도 요소들을 추가할 수 있음
# : Mojo의 struct는 정적으로, runtime중에는 요소들을 추가할 수 없음 (del, change value 등이 runtime 중에는 불가능)
# 이는 trade-off로 유동성을 조금 포기하는 대신, 속도와 안정성 등의 이점을 얻음.

      
struct MyCar:
    # Struct와 class의 차이점2: 
    # : struct는 명시적으로 var, let 등을 통해 구조체 내부의 변수를 선언해줘야 함
    var color: String
    var brand: String
    var year: Int
    var price: Float32

    fn __init__(inout self, color: String, brand: String, year: Int, price: Float32) -> None:
        self.color = color
        self.brand = brand
        self.year = year
        self.price = price
    
    fn __lt__(self, other: MyCar) -> Bool:
        return self.price < other.price

# 여기서 Int와 int의 차이점?
    # Int는 정수형을 의미하는 데이터 타입이고 
    # int는 정수형으로 변환하는 함수이다. 
    # * 이렇게 Int를 설계한 이유: 
        # 1) 시스템 프로그래밍 시에 투명하고 신뢰가능하게 하드웨어와 통신하기 위해 (굳이 JIT 컴파일러를 사용하지 않아도 되도록)
        # 2) 파이썬의 int와 혼동을 하지 않으면서 Mojo의 Int를 사용하기 위해

    # 파이썬의 int와 마찬가지로 Mojo의 Int는 Mojo의 Struct를 기반으로 설계됨.

# Strong Type Checking

fn main():
    let car1 : MyCar = MyCar("red", "BMW", 2020, 100.0)
    let car2 : MyCar = MyCar("blue", "Benz", 2019, 200.0)

    print(car1 < car2) # True -> car1과 car2의 데이터 타입(MyCar)이 같기 때문에 비교 가능
    # print(car1 < 1) # Error -> car1(MyCar)과 1(Int)의 데이터 타입이 다르기 때문에 비교 불가능

    # 파이썬의 경우 타입 어노테이션을 지원하나, 강제성이 떨어지는 hint에 가까움
    # Mojo의 Type Checking은 강제성이 있음. 
    # : 그러므로, 각 변수의 데이터타입을 명확하게 확인하고, 타입이 다른 변수끼리 연산을 시도하면 에러를 발생시킴.

    # 이것이 파이썬만 사용하는 사람들이 어려워할 부분이지만, 안정성과 빠른 속도를 위해 필요한 부분이기도 함.