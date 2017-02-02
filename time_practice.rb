def my_min_one(list)
  list.each do |el1|
    min = true
    list.each do |el2|
      min = false if el1 > el2
    end

    return el1 if min
  end
end

def my_min_two(list)
  min = list.first

  list.each do |element|
    min = element if element < min
  end
  min
end

def largest_contiguous_subsum_one(list)
  #find subarrays
  subs = []
  (0...list.length).each do |start_pos|
    (start_pos...list.length).each do |end_pos|
      subs << list[start_pos..end_pos]
    end
  end
  #other stuff
  max_value = nil
  subs.each do |el|
    max_value = el.inject(:+) if max_value.nil? || el.inject(:+) > max_value
  end
  max_value
end

def largest_contiguous_subsum_two(list)
  max_sum = 0
  cur_sum = 0
  list.each do |num|
    cur_sum = 0 if cur_sum < 0

    cur_sum += num
    max_sum = cur_sum if cur_sum > max_sum
  end

  max_sum == 0 ? list.max : max_sum
end
