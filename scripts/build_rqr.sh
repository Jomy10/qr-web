#!/usr/bin/env zsh
# Bundles rqrcode_core into one file

Combine all files into one single file
cd ../rqrcode_core/lib
../../scripts/combine.rb rqrcode_core.rb > ../../scripts/rqrcode_core_concat.rb
cd ../../scripts

# Drop certain line
# There is still a few `end`s that have to be manually removed
ruby parse_further.rb rqrcode_core_concat.rb > rqrcode_core_concat_parsed.rb

# Format code
rufo rqrcode_core_concat_parsed.rb 

cp rqrcode_core_concat_parsed.rb ../src/rqrcode_core.rb
