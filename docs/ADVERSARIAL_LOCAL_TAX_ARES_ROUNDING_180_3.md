# Independent adversarial review — 地方税法 art.180(3) 端数みなし

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pinned JSON sha256 with Python `hashlib`,
located the needle by walking the raw JSON tree, read the three Lean files and
the transcription check, and stressed the interpretive edge cases. No repository
files were modified by the reviewer.

## Verdict: NO CONCRETE FINDINGS

All five audit tasks passed. No source-transcription error, scope error,
circular spec, unjustified axiom, boundary error, or wrong pin/hash found.

## Finding 1 — pin fidelity (D: PASS)

- **H:** the recorded sha256 / revision / source path are wrong.
- **T:** `hashlib.sha256` over the raw bytes of
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.
- **D: PASS** — file size 12,181,725 bytes; actual hash
  `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  identical to the claimed value in the implementation and `INVENTORY.json`.
- **C:** none material. **U:** none.

## Finding 2 — needle location (D: PASS)

- **T:** full-tree search of the pinned JSON.
- The exact needle `第一項の場合において、百アール未満の端数は、百アールとみなす。`
  occurs **exactly 1 time** in the whole law, at
  `/law_full_text/children/[1]/.../Article 第百八十条 (鉱区税の税率) /
  Paragraph 3 / ParagraphSentence / Sentence 1`, matching the declared source
  path. The reviewer explicitly confirmed the doc/audit use the correct
  `第一項の場合` (the `第一項場合` variant occurs 0 times).
- **D: PASS. C:** none. **U:** none.

## Finding 3 — spec independence / universal proof (D: PASS)

- **H (refuted):** the spec merely restates the implementation (circular).
- Implementation `if r = 0 then 0 else 100` vs. spec structural match
  `| 0 => 0 | _+1 => 100` are genuinely different formulations.
  `agree_ares_rounding : ∀ r, deemedFraction r = specDeemed r` is proved by
  `cases r` — general over all Nat, not a finite sample. No `sorry`/`admit`/
  `axiom`/`Classical.choice` declarations.
- **D: PASS. C:** none. **U:** none.

## Finding 4 — strongest interpretive objection (C: considered, rejected)

- 第一項 is the 鉱区税 rate calc (面積百アールごとに 年額二百円/四百円);
  art.180(3) deems a sub-100-ares fraction as 100 ares. Returning 0 or 100 ares
  is the literal reading. `remainder = 0` correctly yields 0 (no fraction to
  round). 第二項 (oil/gas, 2/3 rate) is explicitly out of scope per 「第一項の
  場合において」 and is not modelled — consistent, not an error.
- **U (non-falsifiable):** the statute does not restrict fractions to integer
  ares; the Nat domain is a mild abstraction, but the rule (0→0, positive→100)
  is invariant to it. `Money` is `abbrev Money := Nat` with no invariants, so
  reusing it as an ares count is a naming smell, not a soundness break — and the
  authors disclose it explicitly. Neither constitutes a finding.

## Finding 5 — boundary theorems (D: PASS)

`no_fraction_is_zero` (0), `smallest_fraction_is_unit` (1→100),
`largest_fraction_is_unit` (99→100), and `deemed_fraction_bounded`
(∀ r, ≤100) are all correct and meaningful. **D: PASS.**

## Closing

No defect required a fix. Needle, pin, spec independence, universal proof and
boundary semantics all survived challenge. No claim of legal correctness;
human legal review remains `LEGAL_REVIEW_PENDING`.
