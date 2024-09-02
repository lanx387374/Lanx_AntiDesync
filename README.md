# ANTI DESYNC 😍
## Description

This script provides a solution to the issue of players not getting killed by headshots due to desynchronization, particularly when players roll on the ground or experience lag. Often, players exploit rolling to avoid headshots and avoid death. This script ensures players are instantly killed on a clear headshot, even if there are synchronization issues.

## Features

- **Headshot Detection:** Automatically detects when players receive a headshot.
- **Instant Damage Application:** Applies damage directly to the player’s health on a headshot.
- **Bypass Rolling:** Bypasses delays caused by rolling or desynchronization to ensure immediate killing.
- **Broad Compatibility:** Standalone script compatible with any framework such as ESX, QBCore, VRP, or any other framework.

## Usage Instructions

1. **Installation:**
   - Copy the script files into your FiveM server resources folder.
   - Add the script to your `server.cfg` file with `start lanx_AntiDesync` or `ensure headshot_fix`.

2. **Script Files:**
   - **`cleint.lua`:** Handles headshot damage application on the server side.
   - **`server.lua`:** Detects headshots and sends requests to the server upon detection.

3. **Configuration:**
   - No additional configuration is required; simply include the script in your server.

## Notes

- Ensure to test the script in a safe environment before deploying it on your live server.
- You may need to adjust damage parameters based on your game balance.

## Contributing

If you wish to contribute to the development or improvement of this script, please feel free to submit a pull request or open an issue on the GitHub repository.
