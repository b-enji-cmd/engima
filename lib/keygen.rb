class Keygen
 def self.square(num)
    num.to_i * num.to_i
 end

 def self.last_four(number)
    number.to_s.slice(-4, 4)
 end

  def self.get_offset(date)
    last_four(square(date))
  end

  def self.key_pairs(number)
    number.chars.each_cons(2).map do |pair| 
    	pair.join.to_i 
    end
  end

  def self.combine_offset_and_key(offsets, keys)
    offsets.chars.map.with_index { |char, index| char.to_i + keys[index] }
  end

  def self.generate_shift(key, date)
    combine_offset_and_key(get_offset(date), key_pairs(key))
  end
	
end