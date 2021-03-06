def fibs(num)
  return [0] if num == 1
  fib_arr = [0, 1]
  while num >= 1
    fib_arr << fib_arr[-1] + fib_arr[-2]
    num -= 1
  end
  fib_arr
end


def fibs_rec(num)
  return [0] if num == 1
  return [0,1] if num == 2
  fibs_array = fibs_rec(num - 1)
  fibs_array << (fibs_array[num - 2] + fibs_array[num - 3])
  fibs_array
end

def merge_sort(array)
  return array if array.length < 2

  pivot = array.first

  left_side = array.drop(1).select { |ele| ele <= pivot }
  right_side = array.drop(1).select { |ele| ele > pivot }

  merge_sort(left_side) + [pivot] + merge_sort(right_side)
end
