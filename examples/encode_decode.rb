$:.unshift(File.expand_path('../../lib', __FILE__))
require 'polybius_sq'

test_str = "bobby salazar"
puts "string to encode: " + test_str
my_vals =  PolybiusSq::encode(test_str)
print "encoded string: "
p my_vals
my_str = PolybiusSq::decode(my_vals)
print "decoded string: "
p my_str


