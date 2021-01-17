require './test/test_helper'

class EnigmaTest < Minitest::Test
	def setup
		@enigma = Enigma.new
	end

	def test_it_is
		assert_instance_of Enigma, @enigma
	end

	def test_it_can_encrypt
		actual = @enigma.encrypt("hello world", "02715", "040895")
		assert_instance_of Hash, actual
		assert_equal "keder ohulw", actual[:encryption]
	end
end