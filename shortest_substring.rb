# frozen_string_literal: true

require 'benchmark'
def shortest_sub(str)
  uni = str.chars.uniq.join

  sub_s = (0..str.size).to_a.combination(2).map do |first, last|
    str[first..last]
  end.uniq

  all_char = sub_s.select do |sub|
    sub.chars.uniq.sort == uni.chars.sort
  end

  all_char.min.size
end

p shortest_sub 'ffghjmnbvgftrdesfghjnbvfredsdfghjnbfvbhuikjhgtfcvghyjhgtfdcvghjhgtredsxcfghgfrewasdcxdfgbvfgtyuhjgtyujuytredfgtyujhgtredftyujhgtrfdcvgtyujhgftresdxftyhgfredftyujhgtredftyuhjgtfrdfgyuiokjhgfcvghyuiokjhgfdcvghuijkjhgfdcvghjhytbsghbvfrtgfdrtyhjkopokmnhgtredfghbvfewqasdfdsxcxzsdszsertyhgfdszxcftyujhgtfghyujhnjuikmklpoiuytrewqasertyhgfdsxcvgyhbgfrewazsxcfghyuhnjiujkiuytfedfgbgfqasedcdrfcvgtgbhyhjiploikjnbgtyuiuhgfdsxdfgvcxzsaqwesdfrtygvbhuijnmkiokmnhytrfvbhjuioplkjhytrfdcfghjnhgbbbbbbbbcbb'
