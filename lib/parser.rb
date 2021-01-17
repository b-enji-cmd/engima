require './lib/enigma'

class Parser
	attr_reader :file_in,
							:file_out

	  def initialize(argv)
    @in_file = argv[0]
    @out_file = argv[1]
    @key = argv[2]
    @date = argv[3]
    @message = File.read(@in_file).chomp
    @enigma =  Enigma.new
  end

  def write_data(output,data)
    File.write(output,data)
  end

  def send_encryption
  	encrypted_message_hash = @enigma.encrypt(@message)
  	write_data(@out_file,encrypted_message_hash[:encryption])
  end

	
end