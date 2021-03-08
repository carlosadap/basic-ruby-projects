# frozen_string_literal: true

def bubble_sort(array)
  is_sorted = false

  until is_sorted
    is_sorted = true

    (0...array.length - 1).each do |idx|
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        is_sorted = false
      end
    end
  end

  array
end

p bubble_sort([4, 3, 78, 2, 0, 2])
# => [0,2,2,3,4,78]
