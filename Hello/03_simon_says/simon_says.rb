def echo(word)
	return word
end

def shout(word)
	return word.upcase
end

def repeat(word, times=2)
	return ((word + " ") * times).strip
end

def start_of_word(word, num)
	return word[0, num]
end

def first_word(word)
	return word.split[0]
end

def titleize(word)
	words = word.split
	words.length.times do |i|
		if ((words[i] != "and") and (words[i] != "over") and words[i] != "the") or i == 0 
			words[i] = words[i][0].upcase + words[i][1, word.length]
		end
	end
	newWord = words.join(" ")
	return newWord
end