# Imagine a necklace with lettered beads that can slide along the string.
# Here's an example image. In this example, you could take the N off NICOLE and
# slide it around to the other end to make ICOLEN. Do it again to get COLENI, and so on.
# For the purpose of today's challenge, we'll say that the strings "nicole",
# "icolen", and "coleni" describe the same necklace.
#
# Generally, two strings describe the same necklace
# if you can remove some number of letters from the beginning of one,
#   attach them to the end in their original ordering, and get the other string.
#   Reordering the letters in some other way does not, in general, produce a string
#   that describes the same necklace.

### Shift Cher
### As long as the shift is constant
### ## It should return true
### else
### ## It should return false
require 'benchmark'

def necklace?(str, necked_str)
  str = str.upcase
  necked_str = necked_str.upcase

  count = 0

  return false if str.chars.all? { |c| necked_str.chars.include?(c) } == false || str.length != necked_str.length

  x = []

  str.length.times do
    x << str.chars.rotate(count).join
    count += 1
  end
  x.include?(necked_str)
end

p necklace? 'NICNOLE', 'NICNOLE'
p necklace? 'KWIBEMERCIJEREMIAHISTHEBESTBOYINTOWN', 'AHISTHEBESTBOYINTOWNKWIBEMERCIJEREMI'
p necklace? 'KWIBEMERCIJEREMIAHISTHEBESTBOYINTOWN', 'NTOWNKWIBEMERCIJEREMIAHISTHEBESTBOYI'
p necklace? 'KWIBEMERCIJEREMIAHISTHEBESTBOYINTOWN', 'NTOWNKWIBEMERCIJEREMTHEIAHISBESTBOYI'
