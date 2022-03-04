#!/usr/bin/env zsh
# Builds rqrcode_cor to one file

Combine all files into one single file
cd rqrcode_core/lib
../../combine.rb rqrcode_core.rb > ../../rqrcode_core_concat.rb
cd ../..

# Drop certain line
# There is still a few `end`s that have to be manually removed
ruby parse_further.rb rqrcode_core_concat.rb > rqrcode_core_concat_parsed.rb

# Format code
rufo rqrcode_core_concat_parsed.rb 

cp rqrcode_core_concat_parsed.rb ../wasm/rqrcode_core.rb