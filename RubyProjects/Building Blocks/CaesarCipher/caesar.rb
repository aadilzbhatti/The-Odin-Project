def caesar_cipher(string, shift = 0)
	if shift == 0
		return string
	end
	if shift > 26
		shift = shift % 26
	end
	words = string.split()
	words.length.times do |i|
		words[i].length.times do |j|
			char = words[i][j].codepoints.first
			if not letter?((char).chr)
				words[i][j] = words[i][j]
			elsif (char + shift).chr > 'z' or (words[i][j] == words[i][j].upcase and (char + shift).chr > 'Z')
				words[i][j] = (char - (26 - shift)).chr
			else
				words[i][j] = (char + shift).chr
			end
		end
	end
	return words.join(" ")
end

def letter?(lookAhead)
  lookAhead =~ /[[:alpha:]]/
end