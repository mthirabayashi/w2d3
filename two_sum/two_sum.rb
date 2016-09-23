
# O(n) time complexity
def bad_two_sum?(arr,target)
  arr.each do |x|
    arr.each do |y|
      return true if x+y==target
    end
  end
  false
end

# p bad_two_sum?([1,2,3,4,5], 7)

# O(n log n)
def okay_two_sum?(arr,target)
  arr.sort!
  i = 0
  j = arr.length-1
  until i == j
    return true if arr[i]+arr[j] == target
    if arr[i]+arr[j] > target
      j -= 1
    else
      i += 1
    end
  end
  false
end

# p okay_two_sum?([4,12,3,1,2], 14)
# p okay_two_sum?([4,12,3,1,2], 1123)

def pair_sum?(arr, target)
  hash = Hash.new(0)
  arr.each { |el| hash[el] += 1}
  hash.each do |k, v|
    return true if hash.include?(target - k)
  end
  false
end

def four_sum?(arr, target)
  left = arr.take(arr.length / 2)
  right = arr.drop(arr.length / 2)
  target.times do |x|
    return true if pair_sum?(left, x) && pair_sum?(right, target - x)
  end
  false
end

# break function, negatives don't work && doesn't work
# if all values are on one side
p four_sum?([-4,18,-3,-1,2], 10)
p four_sum?([1,2,3,4,5,6,7,8], 10)
