def substrings(word, dictionary)
	hash = {}
	word = word.downcase
	dictionary.each do |entry|
		if word.include? entry
			hash[entry] = count_em(word, entry)
		end
	end
	return hash
end

def count_em(string, substring)
  string.scan(/(?=#{substring})/).count
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]