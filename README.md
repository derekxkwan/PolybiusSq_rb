# polybius_sq-gem
ruby module to encode and decode messages with a polybius square


The class **PolybiusSQ** is defined in lib/polybius_sq.rb

Exposed methods are PolybiusSq::encode and PolybiusSq::decode


Both take two args (one opt): input and replace (defaults to ["j", "i"])


Replace should be an array with 2 one-character strings and both encode and decode replace the first element with the second
