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

	def test_it_can_decrypt
		actual = @enigma.decrypt("keder ohulw","02715", "040895")
		assert_instance_of Hash, actual
		assert_equal "hello world", actual[:encryption]
	end

	def test_it_can_generate_random_values
		today = mock
		Date.expects(:today).returns(today)
		today.expects(:strftime).returns("011721")
		assert_equal "011721", @enigma.get_date
	end
end