require 'byebug'
def first_anagram?(word_one, word_two)
  #O(n n!)
  word_one.chars.permutation.map(&:join).include?(word_two)
end

def second_anagram?(word_one, word_two)
  #O(nm^2 (according to delete))
  word_one.each_char do |letter|
    if word_two.include?(letter)
      word_one.delete!(letter)
      word_two.delete!(letter)
    end
  end

  return word_one.empty? && word_two.empty?
end

def third_anagram?(word_one, word_two)
  word_one.chars.sort.join == word_two.chars.sort.join
  #currently n^2
  #with direct sorting method for chars in a string, could be O(n) of your sorting method (ie nlogn)
end

def fourth_anagram?(word_one, word_two)
  #O(n)
  hash_one = Hash.new(0)
  hash_two = Hash.new(0)

  word_one.each_char { |letter| hash_one[letter] += 1 }
  word_two.each_char { |letter| hash_two[letter] += 1 }

  hash_one == hash_two
end

def bonus_anagram?(word_one, word_two)
  #O(n)
  hash = Hash.new(0)

  word_one.each_char { |letter| hash[letter] += 1 }
  word_two.each_char { |letter| hash[letter] -= 1 }

  hash.values.all?{|count| count == 0}
end
