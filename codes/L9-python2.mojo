# L8: python 🔥

# Mojo의 진가는 python을 너무나도 쉽게 사용할 수 있다는 것에서 옵니다.
# 특히 파이썬에서 내가 짠 코드, 혹은 라이브러리(cv2, numpy, torch ...)를 가지고 올 수도 있습니다.

from python import Python

def main():
    Python.add_to_path("./")
    let compare = Python.import_module("compare")

    let c = compare.do_compare(2, 3)
    print(c) # -1