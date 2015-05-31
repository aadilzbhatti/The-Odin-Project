class Book
	attr_accessor :title

	def title= title
		@title = titleize(title)
	end
end


def titleize(word)
	words = word.split
	words.length.times do |i|
		if ((words[i] != "and") and (words[i] != "over") and words[i] != "an" and (words[i] != "of") and (words[i] != "in") and (words[i] != "a") and (words[i] != "the")) or i == 0 
			words[i] = words[i][0].upcase + words[i][1, word.length]
		end
	end
	return words.join(" ")
end
