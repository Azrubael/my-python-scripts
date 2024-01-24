import pprint

# Passes all checks
sample1 = """295743861
431865927
876192543
387459216
612387495
549216738
763524189
928671354
154938672"""

# Passes only row check
sample2 = """195743862
431865927
876192543
387459216
612387495
549216738
763524189
928671354
254938671"""

# Passes only block check
sample3 = """295743861
431865927
876192543
387459216
612387495
549216738
163524189
928671354
154938672"""

pattern = '123456789'

def read_sample(sample):
    sample = sample.split('\n')
    matrix = []
    for row in sample:
        matrix.append([int(char) for char in row])

    return matrix


def check_rows(matrix):
    result = None
    for row in matrix:
        if pattern != str(''.join([str(d) for d in sorted(row)])):
            result = False
            break
    else:
        result = True
    
    return result


def check_cols(matrix):
    result = None
    for r in range(9):
        col = ''
        for c in range(9):
            col += str(matrix[c][r])
        col = ''.join(sorted(list(col)))
        if pattern != col:
            result = False
            break
    else:
        result = True

    return result
            

def check_blocks(matrix):
    result = None
    for cols in range(0,9,3):
        for row in range(0,9,3):
            array = []
            block_pattern = ''
            for i in range(3):
                array += [d for d in matrix[cols+i][row:row+3]]
            for i in sorted(array):
                block_pattern += str(i)
            print(block_pattern)
            if pattern != block_pattern:
                result = False
                break
        else:
            result = True

    return result


def main():
    answer = None
    pp = pprint.PrettyPrinter(width=30, compact=True)
    matrix = read_sample(sample2)
    pp.pprint(matrix)
    if  not check_rows(matrix) or \
        not check_cols(matrix) or \
        not check_blocks(matrix):
        answer = 'No'
    else:
        answer = 'Yes'
    print(check_rows(matrix))
    print(check_cols(matrix))
    print(check_blocks(matrix))
    print(answer)


if __name__ == '__main__':
    main()