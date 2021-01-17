require './lib/parser'
require 'pry'

parser = Parser.new(ARGV)
parser.send_decryption

