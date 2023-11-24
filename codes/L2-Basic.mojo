# L2: Basic systems programming extensions 🔥

fn func1(a: Int) -> Int:
    let b = 2 # let은 바꿀 수 없는 변수 선언 
    var c = 2 # var는 바꿀 수 있는 변수 선언  

    if a > 1:
        # b = 2 * a  # error -> 바꿀 수 없는 변수를 바꾸려고 함
        c = 2 * a  # ok -> 바꿀 수 있는 변수를 바꿈
    return c


fn func2(a: Int) -> Int:
    var b: Int = 2
    # var c: Float32 = 2.0
    if a > 1:
        # b = a * c# error ->  Int와 Float32는 다른 타입이므로 할당 불가
        b = b * a # ok -> 같은 타입이므로 할당 가능
    return b
    
fn main():
    let a = 1
    print(func1(a)) # 변수를 선언하고 안쓰면 메모리 문제로 에러가 남
    print(func2(a))