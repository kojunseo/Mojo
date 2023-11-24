# L8: python 🔥

# Mojo의 진가는 python을 너무나도 쉽게 사용할 수 있다는 것에서 옵니다.
# 특히 파이썬에서 내가 짠 코드, 혹은 라이브러리(cv2, numpy, torch ...)를 가지고 올 수도 있습니다.

from python import Python 
from python.object import PythonObject


def main(): # 파이썬 모듈은 dynamic함으로 fn이 아니라 def로 선언합니다.
    # 파이썬 모듈을 손쉽게 불러올 수 있습니다.
    let np = Python.import_module('numpy')
    
    Python.add_to_path("./")
    let mython = Python.import_module('mython')
    let array = np.array([1,2,3])
    print(array)

    mython.type_printer([0, 3], (False, True), 4, "orange", 3.4, array)
    # <class 'list'>
    # <class 'tuple'>
    # <class 'int'>
    # <class 'str'>
    # <class 'float'>
    # <class 'numpy.ndarray'>

    var dictionary = Python.dict()
    dictionary['name'] = 'junseo'
    dictionary["job"] = "programmer"
    
    var keys: PythonObject = ["name", "job", "gender"]
    var N: Int = keys.__len__().__index__() 
    # 토막 파이썬 상식: 파이썬에서는 자주 쓰는 len()을 호출하면 class내부의 __len__()을 호출합니다.
    # 그러므로, keys.__len__()을 호출하면 파이썬의 len(keys)와 같은 결과를 얻을 수 있습니다.

    print(N, "개의 키가 있습니다.")
    for i in range(N): # for문은 파이썬과 동일하게 Mojo에서도 사용할 수 있습니다.
        if Python.is_type(dictionary.get(keys[i]), Python.none()):
        # 파이썬의 `if dictionary.get(keys[i]) == None:`과 동일한 결과
            print(keys[i], "키는 없습니다.")
        else:
            print(keys[i], "키는 있습니다.")
    