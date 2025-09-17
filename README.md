# Setting Anthropic API Environment Variables

This document explains how to use the `set-anthropic-env.sh` script to configure your environment for accessing the Anthropic API through Z.AI.

## Overview

The `set-anthropic-env.sh` script sets up the necessary environment variables in your current shell session to interact with the Anthropic API via Z.AI's endpoint. This allows applications and scripts to authenticate and communicate with the API without hardcoding credentials.

## Prerequisites

Before using this script, ensure you have:

1. A valid Z.AI API key
2. Bash shell environment
3. Basic knowledge of command-line operations

## Setup Instructions

### 1. Obtain Your API Key

First, you need to get your API key from Z.AI:

1. Log in to your Z.AI account
2. Navigate to the API section
3. Generate or copy your API key

### 2. Configure the Script

Edit the `set-anthropic-env.sh` file and replace `your_zai_api_key` with your actual API key:

```bash
export ANTHROPIC_AUTH_TOKEN="your_actual_api_key_here"
```

**Security Note:** Never commit your actual API key to version control. Consider using a placeholder and documenting how users should replace it.

### 3. Make the Script Executable

Run the following command to make the script executable:

```bash
chmod +x set-anthropic-env.sh
```

## Usage

### For Current Session Only

To set the environment variables for your current terminal session:

```bash
./set-anthropic-env.sh
```

After running the script, you'll see a confirmation message:

```
✅ Environment variables set:
   ANTHROPIC_BASE_URL = https://api.z.ai/api/anthropic
   ANTHROPIC_AUTH_TOKEN = [HIDDEN FOR SECURITY]
```

### Making Variables Persistent

If you want these environment variables to be available in all future terminal sessions, you can add them to your shell's profile file:

#### For Bash:

```bash
echo 'export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"' >> ~/.bashrc
echo 'export ANTHROPIC_AUTH_TOKEN="your_actual_api_key_here"' >> ~/.bashrc
source ~/.bashrc
```

#### For Zsh:

```bash
echo 'export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"' >> ~/.zshrc
echo 'export ANTHROPIC_AUTH_TOKEN="your_actual_api_key_here"' >> ~/.zshrc
source ~/.zshrc
```

## Verification

To verify that the environment variables are set correctly:

```bash
echo "ANTHROPIC_BASE_URL = $ANTHROPIC_BASE_URL"
echo "ANTHROPIC_AUTH_TOKEN is set: ${ANTHROPIC_AUTH_TOKEN:+yes}"
```

## Security Considerations

1. **Never share your API key** or commit it to version control.
2. **Avoid displaying the token** in logs or terminal output.
3. **Use environment variables** instead of hardcoding credentials in scripts.
4. **Restrict file permissions** on scripts containing sensitive information.

## Troubleshooting

### Variables Not Set After Script Execution

- Ensure you're running the script with `source` or `.` if you want variables to persist in the current shell:
  ```bash
  source set-anthropic-env.sh
  # or
  . set-anthropic-env.sh
  ```

### API Key Not Working

- Verify that your API key is correct and hasn't expired.
- Check that you've replaced the placeholder text in the script.
- Ensure there are no extra spaces or characters in your API key.

### Variables Not Available in New Terminal Sessions

- If you want variables to persist across sessions, add them to your shell profile as described in the "Making Variables Persistent" section.

## Integration with Applications

Once the environment variables are set, applications that use the Anthropic API will automatically pick them up. For example:

```python
import os
import anthropic

client = anthropic.Anthropic(
    base_url=os.environ.get("ANTHROPIC_BASE_URL"),
    api_key=os.environ.get("ANTHROPIC_AUTH_TOKEN")
)

# Use the client to make API calls
```

## License

This script is provided as-is for educational and development purposes.
