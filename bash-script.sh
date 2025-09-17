#!/bin/bash

# set-anthropic-env.sh
# Sets Anthropic API environment variables for current shell session

export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"
export ANTHROPIC_AUTH_TOKEN="your_zai_api_key"

echo "✅ Environment variables set:"
echo "   ANTHROPIC_BASE_URL = $ANTHROPIC_BASE_URL"
echo "   ANTHROPIC_AUTH_TOKEN = [HIDDEN FOR SECURITY]"  # Avoid exposing in logs

# Optional: Verify they're set
# echo "ANTHROPIC_AUTH_TOKEN = $ANTHROPIC_AUTH_TOKEN"  # Uncomment only for deb$

