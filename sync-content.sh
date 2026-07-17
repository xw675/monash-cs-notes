#!/bin/bash
# Re-sync notes from your Obsidian vault into the site, then publish.
# Usage: ./sync-content.sh [path-to-vault]
set -e
cd "$(dirname "$0")"
VAULT="${1:-$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian}"
[ -d "$VAULT/20_Concepts" ] || { echo "Vault not found at: $VAULT"; echo "Pass the path: ./sync-content.sh /path/to/vault"; exit 1; }
rm -rf content/10_Units content/20_Concepts content/90_Attachments
cp -R "$VAULT/10_Units" "$VAULT/20_Concepts" "$VAULT/90_Attachments" content/

# Normalize display-math fences for Quartz's stricter parser:
# Obsidian accepts "$$\begin{aligned}" and "\end{aligned}$$" on shared lines;
# Quartz (micromark) needs each $$ fence of a MULTI-LINE block on its own line.
# Single-line "$$x = 1$$" equations are valid and left untouched.
find content -name '*.md' -print0 | xargs -0 perl -pi -e '
  s/^(\$\$)(?=\S)/$1\n/ unless /^\$\$.*\$\$\s*$/;
  s/^(?!\$\$)(.*\S)(\$\$)\s*$/$1\n$2/ unless /\$\$.*\$\$/;
'

echo "✅ Synced + math fences normalized."
echo "To publish:  git add -A && git commit -m 'update notes' && git push"