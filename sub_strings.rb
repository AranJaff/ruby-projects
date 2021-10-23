dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(text, dictionary)
    array = text.gsub(/[[:punct:]]/, '').split(" ")
    hash = Hash.new()
    array.map do |word|
        matches = dictionary.count(word) 
        hash[word] = matches if matches != 0
    end
    puts hash
end

substrings("something like horn is going so low in below.", dictionary)