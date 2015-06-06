cat <<L > Gemfile.lock


BUNDLED WITH
  99999999.0.0

L

contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

out=$(bvm -v 2>&1)
expected="Unable to resolve dependency: user requested 'bundler (= 99999999.0.0)"
if contains "$out" "$expected" == 0
then
  printf '.'
else
  echo "Expected '$expected', got '$out'"
  exit 1
fi
