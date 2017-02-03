require 'byebug'
def bad_two_sum?(arr, val)
  #O(n^2)
  (0...arr.length - 1).each do |i|
    (i + 1... arr.length).each do |j|
      return true if arr[i] + arr[j] == val
    end
  end
  false
end

def okay_two_sum?(arr,val)
  #O(nlogn)
  sorted = arr.sort

  until sorted.length == 1
    case (sorted.first + sorted.last) <=> val
    when 0
      return true
    when -1
      sorted.shift
    when 1
      sorted.pop
    end
  end
  false
end

def two_sum?(arr,val)
  #O(n)
  hash = {}

  arr.each do |el|
    return true if hash[val-el]
    hash[el] = true
  end
  false
end
