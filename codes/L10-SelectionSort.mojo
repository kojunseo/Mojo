# %%%python
# def selection_sort(arr):
#     n = len(arr)
#     for i in range(n - 1):
#         least = i
#         # write your code :)
#         for j in range(i+1, n):
#             if(arr[least]>arr[j]):
#                 least = j
#         if i != least:
#             arr[least], arr[i] = arr[i], arr[least]
#     return arr

from utils.vector import DynamicVector

alias MAX_ITERS = 100


# fn selection_sort(array):

@paramter
fn get_vector() -> DynamicVector[Int]:
    let st = StaticTuple[MAX_ITERS, Int](14, 72, 50, 83, 18, 20, 13, 30, 17, 87, 94, 65, 24, 99, 70, 44, 5, 12, 74, 6, 32, 63, 91, 88, 43, 54, 27, 39, 64, 78, 29, 62, 58, 59, 61, 89, 2, 15, 41, 9, 93, 90, 23, 96, 73, 14, 8, 28, 11, 42, 77, 34, 52, 80, 57, 84, 21, 60, 66, 40, 7, 85, 47, 98, 97, 35, 82, 36, 49, 3, 68, 22, 67, 81, 56, 71, 4, 38, 69, 95, 16, 48, 1, 31, 75, 19, 10, 25, 79, 45, 76, 33, 53, 55, 46, 37, 26, 51, 92, 86)
    var v = DynamicVector[Int](st.__len__())

    for i in range(st.__len__()):    
        v.push_back(st[i])
    return v

fn main():
    var v = get_vector()
    print("Before sorting: ")
    for i in range(v.__len__()):
        print_no_newline(v[i], ", ")