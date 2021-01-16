require './test/test_helper'

class EncoderTest < Minitest::Test
	def test_it_has_the_alphabet
		expected = ["a", "b", "c", "d", "e", "f", "g","h", "i", "j", "k", "l", "m",	"n", "o", "p","q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

		assert_equal expected, Encoder.char_set
		assert_equal 27, Encoder.char_set.length
	end

	def test_it_can_grab_index_of_character
		assert_equal 0, Encoder.char_index_of("a")
		assert_equal 11, Encoder.char_index_of("l")
	end

	def test_it_can_encode
		Keygen.expects(:generate_shift).returns([3, 27, 73, 20])
		assert_equal "keder ohulw", Encoder.encode("hello world", "02715", "040895")
	end

	def test_it_can_encrypt_hello_world
		Keygen.expects(:generate_shift).returns([3, 27, 73, 20])
		assert_equal "keder ohulw", Encoder.encrypt("hello world", "02715", "040895")
	end

	def test_it_can_decrypt_kedefijfe_whatever_it_is
		Keygen.expects(:generate_shift).returns([3, 27, 73, 20])
		assert_equal "hello world", Encoder.decrypt("keder ohulw", "02715", "040895")
	end
end