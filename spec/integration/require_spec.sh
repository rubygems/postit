cat <<L > foo.rb
require 'postit/setup'
print Bundler::VERSION
L

out=$(BUNDLER_VERSION="1.10.2" ruby foo.rb)
expected="1.10.2"
if [ "$out" = "$expected" ]
then
  printf '.'
else
  echo "\nFailure in $0\nExpected '$expected', got '$out'"
  exit 1
fi
