SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

if [ ! -f "$SCRIPT_DIR/.env" ]; then
  echo "Creating .env file"
  cp $SCRIPT_DIR/.env.sample $SCRIPT_DIR/.env
  echo "Created .env file"
fi

echo "Copying hooks from $SCRIPT_DIR/git/hooks to .git/hooks"
cp $SCRIPT_DIR/git/hooks/pre-push $SCRIPT_DIR/.git/hooks/pre-push


$SCRIPT_DIR/scripts/init.sh $SCRIPT_DIR
exit 0