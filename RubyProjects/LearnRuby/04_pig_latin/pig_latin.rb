def translate(word)
	arr = word.split
	arr.length.times do |i|
		arr[i] = pig_latin(arr[i])
	end
	return arr.join(" ")
end

def pig_latin(word)
	start = word[0]
	vowels = ['a', 'e', 'i', 'o', 'u']
	consonants = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']
	if vowels.include? start
		return word + "ay"
	elsif consonants.include? start
		if consonants.include? word[1] or (consonants.include? start and word[1] == 'u')
 			if consonants.include? word[2] or (word[1,2] == 'qu')
				return word[3, word.length] + word[0, 3] + "ay"
			end
			return word[2, word.length] + word[0, 2] + "ay"
		end
		return word[1, word.length] + start + "ay"
	end
end