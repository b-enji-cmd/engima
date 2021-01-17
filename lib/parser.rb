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

	
end