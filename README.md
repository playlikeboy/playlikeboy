<a href="https://playlikeboy.github.io"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/playlikeboy/playlikeboy/main/assets/readme/hero-dark.svg"><img src="https://raw.githubusercontent.com/playlikeboy/playlikeboy/main/assets/readme/hero.svg" alt="From Shaswat Raj to you, hiring for SDE, Forward-Deployed and DevOps roles. [PATCH 0/6] fixes in code I don't maintain: merged in gemini-cli, MoFA, Preact and Editor.js; Go fixes in review at Kmesh and Jaeger." width="100%"></picture></a>

# Shaswat Raj

Software engineer, B.Tech CSE student at BIT Mesra (graduating May 2028), and Joint Secretary of [ACM BIT Mesra](https://acm-bitmesra.github.io) for 2026–27. I ship software that real users depend on, and I fix bugs in open-source projects I don't maintain.

**Looking for:** SDE, forward-deployed and DevOps/platform internships and new-grad roles, in India or remote.
**Portfolio:** [playlikeboy.github.io](https://playlikeboy.github.io) · **Resume:** [PDF](https://playlikeboy.github.io/resume.pdf) (tailored: [SDE](https://playlikeboy.github.io/resume-sde.pdf) · [FDE](https://playlikeboy.github.io/resume-fde.pdf) · [DevOps](https://playlikeboy.github.io/resume-devops.pdf)) · **Email:** [sh20raj@gmail.com](mailto:sh20raj@gmail.com) · [LinkedIn](https://www.linkedin.com/in/sh20raj/) · [Peerlist](https://peerlist.io/sh20raj)

## Work with real users

| Project | What I did | Evidence |
|---|---|---|
| **[Bitotsav '26](https://playlikeboy.github.io/projects/bitotsav-2026)** | Tech lead for BIT Mesra's festival, ~5,000 participants. Built registration, team and points workflows, the admin panel, and signed-QR entry that keeps working in no-network zones (Redis in front of PostgreSQL). Ran it live. | [Write-up](https://www.linkedin.com/posts/sh20raj_bitotsav-2026-what-a-journey-what-a-responsibility-activity-7442608760193216512-Y_nn) |
| **[SopKit](https://sopkit.github.io)** | 605+ browser tools that process files client-side, with no uploads and no server compute. Built and run solo. 4.3M+ requests and 213K+ visits in 30 days. | [Analytics post](https://www.linkedin.com/posts/sh20raj_indiedev-seo-growthhacking-activity-7392263918737498112-Adp_) · [repo](https://github.com/SopKit/sopkit.github.io) |
| **[CampusLoop](https://campusloop.space)** | Student-only network gated by college email (accepts the domains of 1,350+ Indian colleges): feeds, marketplace, polls, time capsules. Next.js, PostgreSQL, Cloudflare Workers, WebSockets. | [repo](https://github.com/playlikeboy/campusloop) |
| **[IndexFast](https://indexfast.co)** | MCP server on Cloudflare Workers that submits URLs to Google, Bing and IndexNow from inside an IDE. TypeScript, Hono. | [repo](https://github.com/playlikeboy/indexfast) |

## Merged upstream

| Project | Pull request | Language |
|---|---|---|
| google-gemini/gemini-cli | [#20778](https://github.com/google-gemini/gemini-cli/pull/20778): cancelling a turn now also cancels the in-flight chat-compression request (AbortSignal threaded through the execution layers) | TypeScript |
| mofa-org/mofa | [#1577](https://github.com/mofa-org/mofa/pull/1577): replaced a panicking `unwrap()` in cron schedule parsing with error handling · [#1587](https://github.com/mofa-org/mofa/pull/1587), [#1594](https://github.com/mofa-org/mofa/pull/1594): `#[non_exhaustive]` on public enums · plus 5 docs PRs | Rust |
| preactjs/preact | [#5331](https://github.com/preactjs/preact/pull/5331): allow the `list` attribute on every valid input type | TypeScript |
| codex-team/editor.js | [#3040](https://github.com/codex-team/editor.js/pull/3040): hide "Convert to" when there is nothing to convert to | TypeScript |

The gemini-cli and MoFA PRs were authored from my previous account, @SH20RAJ. That account no longer exists, so GitHub shows their author as "ghost". The [gemini-cli merge commit](https://github.com/google-gemini/gemini-cli/commit/f11bd3d0797f1626929b9d095efcb5816c18900c) carries my name.

In review: Go fixes in [kmesh](https://github.com/kmesh-net/kmesh/pulls?q=author%3Aplaylikeboy) (a CNI nil-pointer panic, duplicate DNS refresh loops) and [Jaeger](https://github.com/jaegertracing/jaeger/pull/10024) (sampling config validation), plus Lexical, Radix UI and micromark. Each fix comes with a reproduced, filed issue ([bug journal](https://playlikeboy.github.io/bugs)). Every number here is linked to its source on [playlikeboy.github.io/proof](https://playlikeboy.github.io/proof). The full list refreshes automatically:

<!-- PRS:BEGIN -->
<details>
<summary><strong>Upstream pull requests from @playlikeboy</strong> — 2 merged · 14 in review (+1 draft) · 15 issues filed (updated 2026-11-11, refreshed automatically)</summary>

<br>

**Merged**

| Merged | Repository | Pull request | What it does |
|---|---|---|---|
| 2026-11-01 | codex-team/editor.js | [#3040](https://github.com/codex-team/editor.js/pull/3040) fix(inline-toolbar): do not show "Convert to" when there is nothing to convert to | Inline toolbar hides the "Convert to" entry when no conversion target exists. |
| 2026-10-25 | preactjs/preact | [#5331](https://github.com/preactjs/preact/pull/5331) fix(types): allow list attribute on all valid input types | Type definitions allow the list attribute on every valid input type. |

**In review**

| Opened | Repository | Pull request | What it does |
|---|---|---|---|
| 2026-11-10 | kmesh-net/kmesh | [#1989](https://github.com/kmesh-net/kmesh/pull/1989) fix(cni): print the previous result when CNI_ARGS cannot be loaded | kmesh-cni prints the previous CNI result instead of panicking with a nil dereference when CNI_ARGS cannot be parsed. |
| 2026-11-10 | kmesh-net/kmesh | [#1987](https://github.com/kmesh-net/kmesh/pull/1987) fix(dns): key the refresh queue by domain to avoid duplicate loops | DNS refresh queue is keyed by domain, so repeated xDS updates for one hostname no longer start duplicate refresh loops. |
| 2026-11-05 | kmesh-net/kmesh | [#1983](https://github.com/kmesh-net/kmesh/pull/1983) waypoint: compare dataplane-mode label case-insensitively like the daemon | kmeshctl waypoint compares the istio.io/dataplane-mode label case-insensitively, matching the daemon's enrollment check. |
| 2026-11-02 | codex-team/editor.js | [#3041](https://github.com/codex-team/editor.js/pull/3041) fix(sanitizer): merge sanitize rules for the same tag instead of overwriting them | Sanitizer merges rules declared for the same tag instead of overwriting them. |
| 2026-11-02 | jaegertracing/jaeger | [#10024](https://github.com/jaegertracing/jaeger/pull/10024) fix(sampling): Reject out-of-range params in file strategies | File-based remote sampling now rejects probabilistic params outside [0,1] and rate limits outside int32 at startup and on hot reload, instead of serving them to SDKs. |
| 2026-11-01 | meta/lexical | [#9705](https://github.com/meta/lexical/pull/9705) [lexical-react][lexical-playground] Feature: Draggable individual list items _(draft)_ |  |
| 2026-11-01 | kmesh-net/kmesh | [#1977](https://github.com/kmesh-net/kmesh/pull/1977) utils: decide command success by exit status, not stderr | utils.Execute decides success by exit status; stderr output alone (e.g. iptables-legacy warnings) no longer counts as failure. |
| 2026-10-31 | asyncapi/website | [#5880](https://github.com/asyncapi/website/pull/5880) fix: resolve edit links that 404 for bindings and specification pages | Fixes edit-page links that returned 404 for bindings and specification pages. |
| 2026-10-31 | asyncapi/studio | [#1397](https://github.com/asyncapi/studio/pull/1397) test(studio): add jest runner and unit tests for server-api and specification services | Adds a Jest runner and unit tests for the server-api and specification services. |
| 2026-10-25 | radix-ui/primitives | [#4252](https://github.com/radix-ui/primitives/pull/4252) fix(Select): gate hideOthers on positioned state to avoid hiding active trigger (#4250) |  |
| 2026-10-25 | radix-ui/primitives | [#4251](https://github.com/radix-ui/primitives/pull/4251) fix(DismissableLayer): tie inside pointer capture mark to event identity (#4249) |  |
| 2026-10-24 | meta/lexical | [#9458](https://github.com/meta/lexical/pull/9458) [lexical-markdown] Feature: Support ordered lists that use the ')' delimiter |  |
| 2026-10-22 | micromark/micromark | [#255](https://github.com/micromark/micromark/pull/255) fix(core-commonmark): allow ordered list with leading zeros to interrupt paragraph |  |
| 2026-10-22 | pingdotgg/t3code | [#23775](https://github.com/pingdotgg/t3code/pull/23775) fix(server): suppress redundant keybindings change emission on unchanged revalidation |  |
| 2026-10-22 | meta/lexical | [#9447](https://github.com/meta/lexical/pull/9447) [lexical-markdown] Bug Fix: Preserve NodeState, mode and detail of text nodes with tabs on import |  |

**Issues reported upstream** (bugs found, reproduced and documented; several carry a ready fix)

| Opened | Repository | Issue | Status | Note |
|---|---|---|---|---|
| 2026-11-11 | kmesh-net/kmesh | [#1992](https://github.com/kmesh-net/kmesh/issues/1992) CI: unit-test job runs ./pkg/... only, so ctl/ tests never execute | open |  |
| 2026-11-10 | drizzle-team/drizzle-orm | [#6667](https://github.com/drizzle-team/drizzle-orm/issues/6667) [BUG]: drizzle-kit pull with camel casing turns FIRST_NAME into firstNAME since rc.5 | open | drizzle-kit pull camel-cased FIRST_NAME as firstNAME since rc.5. Fix with tests is ready on the fork branch fix/kit-pull-camel-screaming-snake; drizzle-orm limits PR creation to collaborators, so the branch is linked from the issue. |
| 2026-11-10 | kmesh-net/kmesh | [#1991](https://github.com/kmesh-net/kmesh/issues/1991) kmeshctl secret create fails with AlreadyExists when the existing secret has no spi | open |  |
| 2026-11-10 | kmesh-net/kmesh | [#1990](https://github.com/kmesh-net/kmesh/issues/1990) mcp: get_mesh_namespaces misses namespaces labelled istio.io/dataplane-mode=kmesh (case mismatch with the daemon) | open |  |
| 2026-11-10 | kmesh-net/kmesh | [#1988](https://github.com/kmesh-net/kmesh/issues/1988) kmesh-cni: CmdAdd panics with a nil dereference when CNI_ARGS cannot be loaded | open |  |
| 2026-11-10 | jaegertracing/jaeger | [#10116](https://github.com/jaegertracing/jaeger/issues/10116) ES/OpenSearch SPM queries grouped by operation are capped at 10 operations per service | open |  |
| 2026-11-10 | jaegertracing/jaeger | [#10115](https://github.com/jaegertracing/jaeger/issues/10115) [Bug]: Elasticsearch SPM call rates are low by (lookback-1)/lookback and zero when ratePer <= step | open |  |
| 2026-11-10 | jaegertracing/jaeger | [#10114](https://github.com/jaegertracing/jaeger/issues/10114) [Bug]: Prometheus metrics reader sends the wrong rate window for ratePer values that are not a single unit | open |  |
| 2026-11-05 | kmesh-net/kmesh | [#1982](https://github.com/kmesh-net/kmesh/issues/1982) kmeshctl waypoint: dataplane-mode label compared case-sensitively, disagrees with the daemon's enrollment check | open |  |
| 2026-11-02 | jaegertracing/jaeger | [#10023](https://github.com/jaegertracing/jaeger/issues/10023) [Bug]: File sampling provider serves out-of-range probabilistic and ratelimiting params | open |  |
| 2026-11-01 | kmesh-net/kmesh | [#1980](https://github.com/kmesh-net/kmesh/issues/1980) pkg/utils: HashName maps are read by the dual-engine bpf dump while the workload processor writes them (concurrent map crash) | open |  |
| 2026-11-01 | kmesh-net/kmesh | [#1979](https://github.com/kmesh-net/kmesh/issues/1979) mcp: config_dump tool returns 404 when the optional mode argument is omitted | open |  |
| 2026-11-01 | kmesh-net/kmesh | [#1978](https://github.com/kmesh-net/kmesh/issues/1978) pkg/dns: repeated AddDomainInQueue calls for one hostname start duplicate refresh loops that never stop | open |  |
| 2026-11-01 | kmesh-net/kmesh | [#1976](https://github.com/kmesh-net/kmesh/issues/1976) pkg/utils: Execute reports failure whenever the command writes to stderr, even on exit 0 | open |  |
| 2026-10-21 | json-schema-org/website | [#2576](https://github.com/json-schema-org/website/issues/2576) 🐛 Bug: Headings with inline code or formatting produce truncated anchor IDs, breaking TOC and internal links | closed |  |

</details>
<!-- PRS:END -->

## Stack

**Languages:** TypeScript, JavaScript, Go, Rust (contributions), Python, C++, SQL, Bash
**Backend & data:** Node.js, Hono, Express, FastAPI, PostgreSQL, Redis, Drizzle, WebSockets
**Infra:** Docker, GitHub Actions, GitLab CI, Cloudflare Workers, Linux
**AI:** OpenAI / Claude / Gemini APIs, RAG, vector search, Model Context Protocol

## About this account

In October 2026 I moved my work from @SH20RAJ to this account. About 190 repositories are public here. Most are older experiments and libraries I no longer maintain; the pinned repositories and the projects above are the ones to look at. The complete archive is in the [sh20raj-backup](https://github.com/sh20raj-backup) org and on [GitLab](https://gitlab.com/SH20RAJ). Pull requests from before the move show as "ghost" on GitHub.

Elsewhere: [Dev.to](https://dev.to/sh20raj) · [YouTube (StackShade)](https://www.youtube.com/@StackShade) · [npm](https://www.npmjs.com/~sh20raj) · [Codeforces](https://codeforces.com/profile/playlikeboy)
