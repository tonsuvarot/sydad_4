#!/bin/bash -eo pipefail

ngrok start -p 3000 &
sleep 5

ngrok_url=$(curl -s http://127.0.0.1:4040/api/tunnels | jq -r '.tunnels[].public_url')

if [ -z "$ngrok_url" ]; then
  echo "ไม่สามารถดึง URL จาก ngrok ได้"
  exit 1
fi

echo "Application URL: $ngrok_url"