out=$(BUNDLER_VERSION=1.10.2 postit -v)
expected="Bundler version 1.10.2"
if [ "$out" = "$expected" ]
then
  printf '.'
else
  echo "\nFailure in $0\nExpected '$expected', got '$out'"
  exit 1
fi
