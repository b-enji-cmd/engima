require './lib/dictionable'
require './lib/keygen'

class Encoder
	extend Dictionable

	def self.encode(message,key, date,is_encrypt = true)
		shift_code = Keygen.generate_shift(key,date)
		message.chars.reduce("") do |encoded_str, char|
			if is_encrypt
				encoded_str.concat(char_set[(char_index_of(char) + shift_code.first) % 27])
				shift_code.rotate!
			elsif !is_encrypt
				encoded_str.concat(char_set[(char_index_of(char) - shift_code.first) % 27])
				shift_code.rotate!
			end
			encoded_str
		end
	end

	def self.encrypt(message, key, date)
		encode(message, key, date, true)
	end

	def self.decrypt(message, key, date)
		encode(message, key, date, false)
	end
	
end

