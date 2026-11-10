#!/usr/bin/env bash
# Regenerates the "Upstream pull requests" block in README.md from live GitHub data.
# Requires: gh (authenticated; GITHUB_TOKEN works in Actions), jq.
# Curated one-line notes live in scripts/pr-notes.json keyed by "owner/repo#number".
set -euo pipefail

USER_LOGIN="${PR_USER:-playlikeboy}"
README="${README_PATH:-README.md}"
NOTES="${NOTES_PATH:-scripts/pr-notes.json}"
BEGIN='<!-- PRS:BEGIN -->'
END='<!-- PRS:END -->'

fetch() { # $1 = extra gh search flags
  # shellcheck disable=SC2086
  gh search prs --author "$USER_LOGIN" $1 --limit 200 \
    --json repository,number,title,url,createdAt,closedAt,isDraft,state
}

merged_json=$(fetch "--merged")
open_json=$(fetch "--state open")
issues_json=$(gh search issues --author "$USER_LOGIN" --limit 200 \
  --json repository,number,title,url,createdAt,state \
  | jq --arg u "$USER_LOGIN" '[.[] | select(.repository.nameWithOwner | startswith($u + "/") | not) | select(.repository.nameWithOwner | startswith("sh20raj-backup/") | not)]')

[ -f "$NOTES" ] || echo '{}' > "$NOTES"

render_table() { # $1 = json array, $2 = date field, $3 = date header
  jq -r --arg df "$2" --slurpfile notes "$NOTES" '
    sort_by(.[$df]) | reverse | .[] |
    (.repository.nameWithOwner + "#" + (.number|tostring)) as $key |
    ($notes[0][$key] // "") as $note |
    "| " + (.[$df][0:10]) + " | " + .repository.nameWithOwner + " | [#" + (.number|tostring) + "](" + .url + ") " + (.title | gsub("\\|"; "\\|")) + (if .isDraft then " _(draft)_" else "" end) + " | " + $note + " |"
  ' <<<"$1"
}

merged_count=$(jq 'length' <<<"$merged_json")
open_count=$(jq 'length' <<<"$open_json")
issue_count=$(jq 'length' <<<"$issues_json")
today=$(date -u +%Y-%m-%d)

block=$(cat <<EOF
$BEGIN
<details>
<summary><strong>Upstream pull requests from @${USER_LOGIN}</strong> — ${merged_count} merged · ${open_count} in review · ${issue_count} issues filed (updated ${today}, refreshed automatically)</summary>

<br>

**Merged**

| Merged | Repository | Pull request | What it does |
|---|---|---|---|
$(render_table "$merged_json" closedAt)

**In review**

| Opened | Repository | Pull request | What it does |
|---|---|---|---|
$(render_table "$open_json" createdAt)

**Issues reported upstream** (bugs found, reproduced and documented; several carry a ready fix)

| Opened | Repository | Issue | Status |
|---|---|---|---|
$(jq -r 'sort_by(.createdAt) | reverse | .[] | "| " + (.createdAt[0:10]) + " | " + .repository.nameWithOwner + " | [#" + (.number|tostring) + "](" + .url + ") " + (.title | gsub("\\|"; "\\|")) + " | " + .state + " |"' <<<"$issues_json")

</details>
$END
EOF
)

tmp=$(mktemp)
awk -v begin="$BEGIN" -v end="$END" -v block="$block" '
  $0 == begin { print block; skipping = 1; next }
  $0 == end { skipping = 0; next }
  !skipping { print }
' "$README" > "$tmp"
mv "$tmp" "$README"
echo "README updated: ${merged_count} merged, ${open_count} open, ${issue_count} issues"
