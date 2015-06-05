out=$(bvm -v)
if [ "$out" = "$(bundle -v)" ]
then
  printf '.'
else
  echo "Expected '$(bundle -v)', got '$out'"
  exit 1
fi
