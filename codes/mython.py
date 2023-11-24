def do_compare(a, b):
    if a > b:
        return 1
    elif a == b:
        return 0
    else:
        return -1

def type_printer(my_list, my_tuple, my_int, my_string, my_float):
    print(type(my_list))
    print(type(my_tuple))
    print(type(my_int))
    print(type(my_string))
    print(type(my_float))