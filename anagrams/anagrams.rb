# O(n * n!)
def anagram?(str1, str2)
  perms = str1.split('').permutation(str1.length).to_a.map { |x| x.join('') }
  perms.include? str2
end


# O(n^2)
def second_anagram?(str1, str2)
  return true if str1.length==0 && str2.length==0
  return false if str2.length==0 || str1.length==0
  letter = str1[0]
  second_anagram?(str1.delete(letter), str2.delete(letter))
end


# O(n log(n))
def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end


# O(n)
def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  str1.each_char { |char| hash1[char] += 1}
  str2.each_char { |char| hash1[char] -= 1}
  hash1.values.all? { |val| val == 0 }
end
