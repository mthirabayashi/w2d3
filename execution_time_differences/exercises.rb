require 'byebug'

def my_min_phase1(arr)
  min = arr.first
  arr.each_with_index do |x, i|
    arr.each_with_index do |y, j|
      min = x if x<y
    end
  end
  return min
end

# puts my_min([4,2,3,1])

def my_min(arr)
  min = arr.first
  arr.each do |el|
    min = el if el<min
  end
  min
end

# puts my_min([4,2,3,-50, 1])

def largest_contiguous_subsum_phase1(list)
  result = []
  list.each_with_index do |x, idx1|
    list.each_with_index do |y, idx2|
      next if idx2<=idx1
      result << list[idx1..idx2]
    end
  end
  max = result.first.inject(:+)
  result.each do |subset|
    subset_value = subset.inject(:+)
    max = subset_value if subset_value > max
  end
  max
end
arr = [2, 3, 6, 7, -6, 7]
# puts largest_contiguous_subsum(arr)

def largest_contiguous_subsum_phase2(arr)
  # byebug
  final_max = arr.inject(:+)
  local_max = final_max
  i = 0
  j = arr.length-1
  until i == j
    if local_max - arr[i] > local_max - arr[j]
      local_max -= arr[i]
      i += 1
    else
      local_max -= arr[j]
      j -= 1
    end
    if local_max > final_max
      final_max = local_max
    end
  end
  final_max
end

puts largest_contiguous_subsum_phase2([5,3,-7])
