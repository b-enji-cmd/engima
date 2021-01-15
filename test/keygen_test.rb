require './test/test_helper'
require 'pry'
class KeygenTest < Minitest::Test

	def setup
		@key_generator = Keygen.new
	end

	def test_it_is
		assert_instance_of Keygen, @key_generator
	end

	def test_it_can_square
		assert_equal 15410491321, Keygen.square(124139)
	end

	def test_it_can_get_last_four
		assert_equal "9345", Keygen.last_four(88769345)
	end

	def test_it_can_split_into_num_pairs
		assert_equal [23, 34, 45, 56], Keygen.key_pairs("23456")
	end

	def test_it_can_combine_offset_and_keys
		actual = ["4718", [23, 34, 45, 56]]
		assert_equal [27, 41, 46, 64],  Keygen.combine_offset_and_key(*actual)
	end

	def test_it_can_get_offset_from_date
		assert_equal "3441", Keygen.get_offset("011521")
	end
end