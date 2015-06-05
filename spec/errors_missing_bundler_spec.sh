cat <<L > Gemfile.lock


BUNDLED WITH
  1.0.0

L

out=$(bvm -v 2>&1)
expected="Unable to find bundler (1.0.0). Please run \`gem install bundler -v 1.0.0\` and try again."
if [[ "$out" == *"$expected"* ]]
then
  printf '.'
else
  echo "Expected '$expected', got '$out'"
  exit 1
fi
