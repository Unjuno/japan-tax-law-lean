# Independent adversarial review — 関税定率法施行令 第一条の二(1)第三号（十万円超）

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it re-derived the hash/revision/law identity, located the
needle structurally, verified byte fidelity, read the three Lean files and the
audit check. No repository file was modified by the reviewer.

## Verdict: CONCRETE FINDINGS (2) — both reproduced and FIXED

The hash, revision, law identity (CabinetOrder), article label, amount (¥100,000),
strictness (超え = strict >), independent spec, universal proof and boundary
theorems were all verified sound. Two concrete defects were found and fixed.

## F1 — Transcription defect in the Lean source's 原文 quote (MEDIUM, FIXED)

- **H:** the file's "原文逐語（pinned, 一字一句改変なし）" quote was NOT byte-faithful:
  it contained `个` (U+4E2A, simplified Chinese) where the authoritative law/queue
  require `個` (U+500B, Japanese kanji).
- **T:** census of `CustomsDutiableValueThreshold.lean`: `個`(U+500B)=0, `个`(U+4E2A)=1;
  line 20 segment after ほか、 was `U+4E00 U+4E2A U+53C8` = 一个. The raw law JSON
  and the queue text use `U+4E00 U+500B U+53C8` = 一個. `json.dumps` byte comparison
  confirmed the mismatch. Author independently reproduced via a census script.
- **D: FAIL** on the quote. **Fix applied:** line 20 `个` → `個`; byte-fidelity
  restored. Compiled defs were unaffected; full gates re-run green (626-job build,
  192/192 transcription, no-sorry clean).
- **C:** none — U+4E2A ≠ U+500B is unambiguous. This was the very bug class the
  author had already fixed in the audit needle, but had not applied to the Lean
  file it backs.
- **U:** comment-only (doc quote), not affecting kernel proofs; but it falsified an
  explicit character-for-character veracity claim in a legal-transcription artifact.

## F2 — Stale/incorrect justification comment in the audit script (LOW, FIXED)

- **H:** the comment claimed `find_article_text` "surfaces a different 第一条の二
  (len 770, needle absent)" and used that to justify a file-kind locator.
- **T:** direct `find_article_text("329CO0000000155","第一条の二")` returns the ONLY
  第一条の二: len 770, `has_needle=True` (authoritative needle). Structural walk of
  all Article nodes finds exactly one Num=1_2 and it contains the needle.
- **D: FAIL** on the comment's stated rationale. **Fix applied:** reverted the check
  to the precise article-kind locator, replaced the false comment with an accurate
  one recording that the real cause of the initial failure was the mistyped
  `个`→`個` literal (now corrected), not any locator/nesting issue.
- **C:** the author's nested-Article-wrapper hypothesis was simply wrong; the
  wrong-character literal caused both locator failures.
- **U:** no effect on check correctness; the check passed either way.

## Verification passes (no finding)

| # | Check | Result |
|---|---|---|
| 1 | sha256 of pinned law.json | `7f76960b…15d01` (459,811 bytes) matches brief & INVENTORY source_sha256 — PASS |
| 2 | revision existence | `329CO0000000155_20260401_508CO0000000085` in INVENTORY, on disk, raw revision_info, revisions.json (CurrentEnforced, enforce 2026-04-01) — PASS |
| 3 | law identity | 329CO0000000155, 昭和二十九年政令第百五十五号, 関税定率法施行令, CabinetOrder — PASS |
| 4 | audit needle byte-fidelity | audit needle == queue text `…一個…` (U+500B); whole-law count 1; CN variant count 0 — PASS |
| 5 | article label | Num=1_2, ArticleTitle=第一条の二, Paragraph 1, Item 3 — PASS |
| 6 | amount/strictness | 十万円=100,000; 超え=strict >; `aboveThreshold v := 100000 < v` — PASS |
| 7 | spec independence | successor form vs `<`; `agree_threshold` universal via Nat.succ_le_of_lt / Nat.lt_of_succ_le — PASS |
| 8 | forbidden tokens | only in doc comment, none in proof terms — PASS |
| 9 | domain soundness | `Money := Nat`; whole-yen domain defensible — PASS |
| 10 | boundary theorems | threshold_exclusive / first_above / threshold_decoded, kernel-sound — PASS |
| 11 | full audit | 192/192 PASS, including this unit — PASS |

## Interpretive objections (a)–(e) — no findings

- (a) 超える is strict; 100,000 excluded, 100,001 included — boundary correct.
- (b) Only the threshold sub-condition of Item 3 is modeled; the 「前二号に掲げる
  もののほか」 gate, Items 1-2, gated rule, customs valuation are out of scope —
  explicitly and honestly documented. U: modeled predicate is weaker than the full
  legal condition, acceptable per declared scope.
- (c) kind=CONDITION appropriate. (d) all labels correct. (e) Nat lemmas + decide sound.

## Closing

No error in law identity, revision/hash, article label, amount, strictness,
equivalence proof or boundary theorems. The 2 concrete defects (F1 byte-fidelity in
the Lean quote, F2 false comment) were reproduced and fixed. No claim of legal
correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
