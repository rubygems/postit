out=$(bvm 1.10.2 -v)
expected="Bundler version 1.10.2"
if [ "$out" == "$expected" ]
then
  printf '.'
else
  echo "Expected '$expected', got '$out'"
  exit 1
fi
