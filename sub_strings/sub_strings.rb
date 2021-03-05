def substrings(string, array)
  words = string.split(" ")
  substrings_hash = Hash.new(0)

  array.each do |word|
    if string.include?(word)
      substrings_hash[word] += 1
    end
  end

  substrings_hash
end

  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  
  puts substrings("below", dictionary)
  # => { "below" => 1, "low" => 1 }

  puts substrings("Howdy partner, sit down! How's it going?", dictionary)
  # => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }