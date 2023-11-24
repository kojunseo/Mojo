# L7: init 🔥
# Mojo에서는 c++와 swift를 통해 '@value' 데코레이터를 통해 Value Semantics을 지원합니다.
# 이는 뒤에서 더 자세히 다룰 개념임으로 '@value'는 뒤에서 다시 다루도록 하겠습니다.

# 객체(struct)를 초기화할 때 사용되는 special method가 있습니다.

# 1. `__init__`: 객체를 초기화하는 함수입니다.

# 2. `__copyinit__`: 객체를 복제할 때 참고하는 함수입니다.

# 3. `__del__`: 객체를 삭제할 때 사용하는 함수입니다.

from memory.unsafe import Pointer

# 데이터를 할당하는 [], alloc, free, load, store 등의 개념은 추후 Vector, Pointer에서 다루도록 하겠습니다.
struct HeapArray:
    var data: Pointer[Int]
    var size: Int

    fn __init__(inout self, size:Int, val:Int):
        self.size = size
        self.data = Pointer[Int].alloc(self.size) 
        for i in range(self.size):
            self.data.store(i, val)
        
    fn __del__(owned self):
        self.data.free()

    fn __copyinit__(inout self, other:Self): # 대문자 Self는 현재 객체의 데이터 타입을 의미합니다.
        self.size = other.size
        self.data = Pointer[Int].alloc(self.size)
        for i in range(self.size):
            self.data.store(i, other.data.load(i))

    fn dump(self):
        print_no_newline("[") # print()는 자동으로 개행을 하기 때문에 파이썬에서 sep=""를 주는 것과 동일한 기능을 하는 print_no_newline()을 제공합니다.
        for i in range(self.size):
            if i > 0:
                print_no_newline(", ")
            print_no_newline(self.data.load(i)) 
        print("]")


fn main():
    var a = HeapArray(3, 1)
    a.dump() # [1, 1, 1]

    var b = a
    b.dump() # [1, 1, 1] 
    a.dump() # [1, 1, 1]