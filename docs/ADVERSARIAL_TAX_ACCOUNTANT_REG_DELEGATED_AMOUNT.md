# Independent adversarial review — 税理士法施行令 art.6の2(2)（八千八百円）

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pin hash, located the needle by structural
walk, verified law identity (CabinetOrder) and article label, and read the three
Lean files plus the audit check. No repository files were modified by the reviewer.

## Verdict: CONCRETE FINDING (false revision/snapshot label) — reproduced and FIXED

Everything substantive (law identity, article label, amount, proofs, audit check)
was verified correct. The single defect was provenance metadata: the unit claimed
a revision id and snapshot filename that do not exist in the repository.

## Finding 1 — FALSE revision id and snapshot filename (H/T/D/C/U, FIXED)

- **H:** the unit's pinned source is revision `326CO0000000216_20261101_508CO0000000179`
  at `data/raw/326CO0000000216_20261101_508CO0000000179.law.json`.
- **T:** `data/INVENTORY.json` → `current_revision.law_revision_id =
  326CO0000000216_20240401_505CO0000000146`, `raw_snapshot.source_file =
  data/raw/326CO0000000216_20240401_505CO0000000146.law.json`; the raw file's
  `revision_info.law_revision_id` is the same 20240401 value; the only law.json
  for 326CO0000000216 is the 20240401 one. The string `508CO0000000179` appears
  nowhere in `data/*.json`. The author independently reproduced this with a
  hash/INVENTORY check script: the real file hashes to `346e24c2…cf8d296` (the
  sha256 was correct, but for the 20240401 revision, not the fabricated label).
- **D: FAIL** on the label. **Fix applied:** replaced
  `326CO0000000216_20261101_508CO0000000179` → `326CO0000000216_20240401_505CO0000000146`
  and the corresponding snapshot filename in all 7 locations across 5 files
  (impl header×2, spec header, unit doc×2, evidence script, PR body). sha256
  unchanged (correct for the real file). Unit rebuild passed (5 jobs).
- **C:** the hash being correct does not excuse a false revision/filename label —
  the repo contains no such file and INVENTORY/revisions.json/task_queue.json all
  contradict it. The content audited is the 2024-04-01 revision.
- **U:** none material — legal content/formalization unaffected; only provenance
  metadata was wrong, and it is now corrected.

## PASS items (no finding)

| ID | Item | D |
|---|---|---|
| F2 | sha256 of the real 20240401 file = `346e24c2…cf8d296` (matches); needle `法第九条第二項に規定する政令で定める額は、八千八百円とする。` count = 1; 八千八百円 = 8,800 | PASS |
| F3 | law identity 税理士法施行令, 昭和二十六年政令第二百十六号, law_type=CabinetOrder (政令, not 法律) | PASS |
| F4 | article label: needle sits in Article attr.Num=6_2, ArticleTitle=第六条の二, Paragraph 2 → art.6の2(2) correct; Lean docs + audit locator (第六条の二) match. Prior wrong-article failure mode NOT reproduced | PASS |
| F5 | spec genuinely independent (degenerate interval [8800,8800] vs equality); `agree_delegated_amount` universal via subst / Nat.le_refl / Nat.le_antisymm; no sorry/admit/axiom/Classical.choice/unsafe | PASS |
| F6 | boundary theorems correct (at_delegated rfl; below/above `decide` on closed goals — kernel-sound); audit check pinned to law 326CO0000000216, locator 第六条の二, verbatim needle; 190/190 PASS | PASS |

## Interpretive notes (C/U) — not findings

- 「政令で定める額は、八千八百円とする」 = definitional amount-fixing → equality
  faithful. The ¥8,800 is a statutory threshold constant referenced by 税理士法
  art.9(2); extracting only this constant is a legitimate slice, explicitly
  disclaimed (impl/spec/docs). DELEGATION is a reasonable taxonomy.
- **U:** the spec reuses the shared constant `delegatedAmountYen` rather than
  hardcoding 8_800; `amount_is_eight_thousand_eight_hundred : delegatedAmountYen = 8_800 := rfl`
  is the anchor tying it to the source. Acceptable, not blocking.
- **U:** consumers must not read `isDelegatedAmount` as an applicability rule;
  substantive art.9(2) content and 省令 details are out of scope.

## Closing

No soundness break, wrong pin hash, transcription error, circular proof, wrong
law identity, or wrong article label remains. The sole defect (false revision
label) was reproduced and fixed. No claim of legal correctness; human legal
review remains `LEGAL_REVIEW_PENDING`.
