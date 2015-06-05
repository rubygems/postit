out=$(BUNDLER_VERSION=1.10.2 bvm -v)
expected="Bundler version 1.10.2"
if [ "$out" == "$expected" ]
then
  printf '.'
else
  echo "Expected '$expected', got '$out'"
  exit 1
fi
