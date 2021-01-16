module Dictionable
	def char_set
    ("a".."z").to_a << " "
  end

  def char_index_of(char)
    char_set.index(char)
  end
end