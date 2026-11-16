#!/bin/sh
cd "$(dirname "$0")"

if command -v python3 >/dev/null 2>&1; then
  PYCMD=python3
elif command -v python >/dev/null 2>&1; then
  PYCMD=python
else
  echo "Could not find Python 3. Please install it from https://www.python.org/downloads/"
  read -p "Press Enter to close..."
  exit 1
fi

PORT=8765
while command -v lsof >/dev/null 2>&1 && lsof -i ":$PORT" >/dev/null 2>&1; do
  PORT=$((PORT + 1))
done

"$PYCMD" -m http.server "$PORT" &
SERVER_PID=$!
sleep 1
open "http://127.0.0.1:$PORT"
wait $SERVER_PID
