cat <<L > foo.rb
#!/usr/bin/env ruby
require 'bvm/setup'
print Bundler::Version
L

out=$(BUNDLER_VERSION="1.10.2" ruby foo.rb)
expected="1.10.2"
if [ "$out" == "$expected" ]
then
  printf '.'
else
  echo "Expected '$expected', got '$out'"
  exit 1
fi
