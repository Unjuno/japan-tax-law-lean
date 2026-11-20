# Independent adversarial review — 関税定率法 art.8(2) para.8 investigation deadline

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pinned JSON sha256 with Python `hashlib`,
walked the raw JSON tree to locate the needle and its paragraph neighbours,
read the three Lean files and the transcription check. No repository files were
modified by the reviewer.

## Verdict: NO FINDINGS

All adversarial hypotheses were tested and disproven. The unit is internally
consistent with its pinned source.

## Finding 1 — pin fidelity (D: PASS)

- **H:** the recorded sha256 / revision / source path are wrong.
- **T:** `hashlib.sha256` over the raw bytes of
  `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`.
- Actual hash `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`,
  file size 9,407,678 bytes — both match `INVENTORY.json` and the claim.
- **D: PASS. C/U:** none.

## Finding 2 — needle location & neighbours (D: PASS)

- Whole-law substring count = 1 (also 1 under whitespace normalization).
- Structural path: `law_full_text.children[1]` (LawBody) → `MainProvision` →
  `Article 第八条の二` → `ParagraphNum='８'` → ParagraphSentence → Sentence —
  matches the declared source path.
- Neighbour check: para 4 = main investigation (政府は…調査を行う);
  para 7 = supplier non-circumvention investigation; para 8 = the needle.
  So **前項 = para 7, 第四項 = para 4** — correct. Article is the 不当廉売関税
  (anti-dumping duty) regime — correct. Verbatim text matches exactly.
- **D: PASS.**

## Finding 3 — spec independence / universal proof (D: PASS)

- **H (refuted):** the spec merely restates the implementation (circular).
- `withinInvestigationDeadline = endDay ≤ refDay` vs.
  `specWithinInvestigationDeadline = endDay - refDay = 0` are genuinely distinct
  (Nat order vs. truncated subtraction). `agree_investigation_deadline` is a
  universally quantified theorem over all Nat pairs, proved by
  `Nat.sub_eq_zero_iff_le.symm` — not a finite sample. No `sorry`/`admit`/
  `axiom`/`Classical.choice`. `Nat` is a sound domain for non-negative day indices.
- **D: PASS.**

## Finding 4 — competing interpretation (C: rejected as a finding)

- **C:** could 「…日までに終了する」 mean strictly before (`endDay < refDay`)?
- **D:** No. In Japanese legal usage 「…日までに」 includes the named day. Context:
  paras 5/12 use duration phrasing 「十月以内に」 for elapsed-time limits, while
  para 8 anchors to a specific 「日」, i.e. on-or-before that day. `endDay ≤ refDay`
  is faithful and neither adds a lower bound nor over-approximates.

## Finding 5 — boundary theorems (D: PASS)

`deadline_at_reference` (r≤r), `deadline_one_day_late` (¬ r+1≤r),
`deadline_extends_to_later_ref` (transitivity), and `agree_investigation_deadline`
(correct direction, universal) are all correct and meaningful.

## Residual uncertainties (not findings)

- The reviewer did not re-run `lake build` (per instruction); kernel-checking is
  asserted from code inspection plus the author's recorded full-build pass.
  The theorem and `omega` are standard core/Std — confidence high.
- The normative unit id hash was not independently recomputed (no derivation
  spec supplied); all other identity fields were independently verified.

## Closing

No defect required a fix. Needle, pin, spec independence, universal proof,
inclusive-deadline semantics and boundaries all survived challenge. No claim of
legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
