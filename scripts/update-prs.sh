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

# Only upstream work counts: drop PRs against the user's own repositories and
# against orgs the user owns or runs (own startup org, college club, backups).
# Those are real work but not "upstream"; counting them reads as padding.
OWN_ORGS="${OWN_ORGS:-sh20raj-backup,campusloop-space,acm-bitmesra}"
own_repo_filter='[.[] | (.repository.nameWithOwner | split("/")[0]) as $o | select($o != $u and (($orgs | split(",")) | index($o) | not))]'

fetch() { # $1 = extra gh search flags
  # shellcheck disable=SC2086
  gh search prs --author "$USER_LOGIN" $1 --limit 200 \
    --json repository,number,title,url,createdAt,closedAt,isDraft,state \
    | jq --arg u "$USER_LOGIN" --arg orgs "$OWN_ORGS" "$own_repo_filter"
}

merged_json=$(fetch "--merged")
open_json=$(fetch "--state open")
issues_json=$(gh search issues --author "$USER_LOGIN" --limit 200 \
  --json repository,number,title,url,createdAt,state \
  | jq --arg u "$USER_LOGIN" --arg orgs "$OWN_ORGS" "$own_repo_filter")

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
open_count=$(jq '[.[] | select(.isDraft | not)] | length' <<<"$open_json")
draft_count=$(jq '[.[] | select(.isDraft)] | length' <<<"$open_json")
issue_count=$(jq 'length' <<<"$issues_json")
today=$(date -u +%Y-%m-%d)

block=$(cat <<EOF
$BEGIN
<details>
<summary><strong>Upstream pull requests from @${USER_LOGIN}</strong> — ${merged_count} merged · ${open_count} in review (+${draft_count} draft) · ${issue_count} issues filed (updated ${today}, refreshed automatically)</summary>

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

| Opened | Repository | Issue | Status | Note |
|---|---|---|---|---|
$(jq -r --slurpfile notes "$NOTES" 'sort_by(.createdAt) | reverse | .[] | (.repository.nameWithOwner + "#" + (.number|tostring)) as $key | ($notes[0][$key] // "") as $note | "| " + (.createdAt[0:10]) + " | " + .repository.nameWithOwner + " | [#" + (.number|tostring) + "](" + .url + ") " + (.title | gsub("\\|"; "\\|")) + " | " + .state + " | " + $note + " |"' <<<"$issues_json")

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
