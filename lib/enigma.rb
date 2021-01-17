require "./lib/encoder"
require "date"

class Enigma
	def get_date
    Date.today.strftime("%m%d%y")
  end


	def random_key
    rand(99999).to_s.rjust(5, "0")
  end

  def encrypt(message, key = random_key, date = get_date)
  	{
  		encryption: Encoder.encrypt(message, key, date),
  		key: key,
  		date: date
  	}
  end

   def decrypt(message, key = random_key, date = get_date)
  	{
  		encryption: Encoder.decrypt(message, key, date),
  		key: key,
  		date: date
  	}
  end
	
end