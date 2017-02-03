def windowed_max_range(array,window_size)
  #O(n^2) (worst [window about arr.len / 2]) O(n) (best [window = (1 or arr.len)])
  max_range = nil
  (0..array.length - window_size).each do |i|
    window = array[i,window_size]
    current_range = window.max - window.min

    max_range = current_range if max_range.nil? || max_range < current_range
  end
  max_range
end
