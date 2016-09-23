require 'byebug'
require_relative 'StackQueue'

def naive_windowed_max_range(arr, window)
  current_max_range = 0
  arr.each_with_index do |el, idx|
    window_end = idx+window-1
    break if window_end > arr.length-1
    max = arr[idx..window_end].max
    min = arr[idx..window_end].min
    current_max_range = (max-min) if max-min > current_max_range
  end
  current_max_range
end

def windowed_max_range(arr, window)
  current_max_range = 0
  sq = StackQueue.new
  idx = 0
  window.times do |_|
    sq.enqueue(arr[idx])
    idx += 1
  end
  current_max_range = sq.max - sq.min
  # byebug
  while idx < arr.length
    sq.enqueue(arr[idx])
    sq.dequeue
    current_max_range = sq.max - sq.min if sq.max - sq.min > current_max_range
    idx += 1
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
