out=$(postit -v)
if [ "$out" = "$(bundle -v)" ]
then
  printf '.'
else
  echo "\nFailure in $0\nExpected '$(bundle -v)', got '$out'"
  exit 1
fi
