#!/bin/bash
# Re-sync notes from your Obsidian vault into the site, then publish.
# Usage: ./sync-content.sh [path-to-vault]
set -e
cd "$(dirname "$0")"
VAULT="${1:-$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian}"
[ -d "$VAULT/20_Concepts" ] || { echo "Vault not found at: $VAULT"; echo "Pass the path: ./sync-content.sh /path/to/vault"; exit 1; }
rm -rf content/10_Units content/20_Concepts content/90_Attachments
cp -R "$VAULT/10_Units" "$VAULT/20_Concepts" "$VAULT/90_Attachments" content/
echo "✅ Synced. To publish:  git add -A && git commit -m 'update notes' && git push"
