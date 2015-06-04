lines = File.readlines("text.txt")

line_count = lines.length
puts "#{line_count} lines"

text = lines.join
total_characters = text.length
puts "#{total_characters} characters"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters (excluding spaces)"

words = text.split
total_words = words.length
puts "#{total_words} words"

total_sentences = text.split(/\.|\?|!/).length
puts "#{total_sentences} sentences"

total_paragraphs = text.split(/\n\n/).length
puts "#{total_paragraphs} paragraphs"

puts "#{total_sentences / total_paragraphs} sentences per paragraph (average)."
puts "#{total_words / total_sentences} words per sentence (average)."

stopwords = %w{the a by on for of are with just but and to the my I has some in}
keywords = words.select {|word| !stopwords.include?word}

puts "#{((keywords.length.to_f / total_words.to_f) * 100).to_i}% useful words"

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"