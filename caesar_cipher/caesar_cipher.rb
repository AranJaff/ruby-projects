
def caesar_cipher(string,shift_value)

	shift = shift_value.to_i
	if (shift < 0 || shift > 26)
		puts "Only enter shift from 0 to 26 !"
		return
	end

	char_array = string.split("")
	ord_array = char_array.map {|char| char.ord}

	cryptic_array = ord_array.map do |number|
		# conditions for alphabets a,b,c,...,z in ordinals 
		if (number >= 97 && number <= 122)
			if number >= (122 - shift + 1)
				(number - (26 - shift)).chr
			else
				(number + shift).chr
			end 
		# conditions for alphabets A,B,...,Z in ordinals
		elsif (number >= 65 && number <= 90)
			if number >= (90 - shift + 1)
				(number - (26 - shift)).chr
			else
				(number + shift).chr
			end
		else
			number.chr
		end
	end
	cryptic_array.join()
end

puts caesar_cipher("What a string!", 30)
