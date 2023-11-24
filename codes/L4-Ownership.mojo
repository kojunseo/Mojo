# L4: Ownership 🔥
# Mojo는 Rust언어의 영향을 받아 소유권 개념이 존재한다.
# 소유권은 메모리의 안정성을 위해 필요한 개념으로 파이썬보다 변수의 변경을 엄격하게 관리하여 속도와 안정성을 높인다.
    
# def vs fn
# def는 파이썬과 다르게 모든 인자를 복사하여 받기 때문에 자유롭게 사용할 수 있으나, 외부에 영향을 주지 않는다.
# fn의 내부로 전달되는 인자는 기본적으로 immutable(불변)이기 때문에, 외부의 변수를 그대로 읽어오나(복사x) 변경은 불가능하다.




fn test_inout():
    var a = 1
    let b = 2 # add_num2에서 inout을 통해 가져온 값을 변경하면, 외부의 원 변수도 변경된다.
    let c = add_num1(a, b)
    print(c) # 3

    let d = add_num2(a, b)
    print(a) # 2 -> inout을 통해 가져온 값을 변경하면, 외부의 원 변수도 변경된다.
    print(d) # 4

struct MyInt:
    var value: Int
    
    fn __init__(inout self, v: Int): # self를 inout으로 사용하면, self(구조체 자체)의 값을 변경하고 이것이 원래 구조체에 반영된다.
        self.value = v
        
    # self, rhs 인자는 immutable한 borrowed 변수이다. -> 둘을 더하려고 하는데 rhs의 값과 self모두 변경이 불가능하다.
    fn __add__(self, rhs: MyInt) -> MyInt:
        return MyInt(self.value + rhs.value)

    # self를 inout으로 받을 경우 self의 값을 변경할 수 있다. 
    fn __iadd__(inout self, rhs: MyInt):
        self.value = self.value + rhs.value


fn swap(inout a: Int, inout b: Int):
    let temp = a
    a = b
    b = temp
    # def를 사용하면 a, b를 복사해와야 하기 때문에 swap을 하려면 리턴을 무조건 해서 원래 변수에 영향을 주어야 한다.
    # fn을 사용하면 inout을 통해 가져온 값을 변경하면, 외부의 원 변수도 변경되어 return 하지 않아도 외부 변수에 영향을 줄 수 있다.

fn test_swap():
    var a : Int = 1 # Swap을 할때 변수를 변경해야하기 때문에 let 대신 var로 선언
    var b : Int = 2
    print("Before Swap: ", a, b)
    swap(a, b)
    print("After Swap:", a, b) # 2

# 3. owned (transfer argument) : 주로 ^와 함께 사용
# : exclusive ownership(독점 소유권)을 가지는 변수로, 함수에게 변수의 소유권을 넘겨주는 개념이다.



# 1. borrowed (immutable(불변), default) = c++의 const&와 유사
# : 빌려주는 개념으로, 외부의 변수를 그대로 읽어오나 함수 내부에서도 변경/수정은 불가능하다.
fn add_num1(borrowed a: Int, b: Int) -> Int:
    # a = a + 1 # error -> immutable하기 때문에 변경 불가능
    return a + b


# 2. inout (mutable(가변))
# : 함수에게 변경 가능하도록 변수를 전달하고 싶을 때 사용한다. 
# : 함수 내부에서 inout을 통해 가져온 값을 변경하면, 외부의 원 변수도 변경된다.

fn add_num2(inout a: Int, b: Int) -> Int:
    a = a + 1 # inout을 통해 가져온 값을 변경하면, 외부의 원 변수도 변경된다.
    return a + b


def main():
    let myInt1 = MyInt(1)
    let myInt2 = MyInt(2)

    let myInt3 = myInt1 + myInt2

    print(myInt3.value)
    


    test_swap()
    var a = 1
    let b = 2 # add_num2에서 inout을 통해 가져온 값을 변경하면, 외부의 원 변수도 변경된다.
    print("Original a, b: ", a, b)
    let c = add_num1(a, b)
    print(c) # 3

    let d = add_num2(a, b)
    print(a) # 2 -> inout을 통해 가져온 값을 변경하면, 외부의 원 변수도 변경된다.
    print(d) # 4