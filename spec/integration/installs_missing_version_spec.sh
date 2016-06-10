gem uninstall bundler -v 1.10.2 >/dev/null
if [ $? != 0 ]
then
  echo "\nFailure in $0\nUnable to uninstall bundler 1.10.2"
  exit 1
fi
out=$(postit 1.10.2 -v)
expected="Bundler version 1.10.2"
if [ "$out" = "$expected" ]
then
  printf '.'
else
  echo "\nFailure in $0\nExpected '$expected', got '$out'"
  exit 1
fi
