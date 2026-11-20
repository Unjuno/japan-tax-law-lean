# Independent adversarial review — 日米地位協定関税特例法 art.12(6) scoped deeming

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pinned JSON sha256, walked the raw tree
to locate the needle, read the three Lean files and the transcription check,
and stressed the cross-law interpretation. No repository files were modified.

## Verdict: NO CONCRETE FINDINGS in the four audited files

Pin hash, needle uniqueness/location, spec independence, universal proof,
cross-law `LegalContext` model and boundary theorems all PASS. Adjacent
artifact issues (evidence ledger not yet inserted, a dead doc link, and a
cosmetic typo) were reported separately and fixed by the author below.

## H1/T1/D1 — pin fidelity (PASS)

- **T:** `hashlib.sha256` over the raw JSON bytes.
- Actual `ca251c418b17aef8e9205d8f53417c14214ee9840579bf69e75828e4d9cc1a6d`,
  size 107,649 bytes — matches impl, spec, `INVENTORY.json` and audit.
- **D: PASS.**

## H2/T2/D2 — needle location (PASS)

- Whole-law needle count = 1; path Law → LawBody → MainProvision →
  Article 第十二条 → Paragraph ６ → Sentence#1. Matches the declared source path.
- Context: art.12(1) deems the receipt an 輸入 and applies 関税法/関税定率法/etc.;
  so 「第一項の規定の適用を受ける物品」 = goods subject to that para-1 deeming —
  the `receivesParagraph1 : Bool` abstraction is faithful.
- Scope 「関税法の適用については…同法の外国貨物」 is explicit.
- **C (not a finding):** paragraph 6 has a second sentence (unmodelled, outside
  the pinned `Sentence#1`) deeming 無許可譲受物品 to be goods with import permission
  under 関税法 art.67 in a payment case. The audit label "art.12(6)" therefore
  overstates paragraph-level coverage; the unit itself is one sentence.
- **D: PASS.**

## H3/T3/D3 — Lean integrity / spec independence (PASS)

- Impl `receivesParagraph1 && (ctx == customsLaw)` vs spec `match ctx with
  customsLaw => receivesParagraph1 | otherLaw => false` — syntactically distinct,
  spec does not call impl.
- `agree_deemed_foreign_goods` is `∀ (receivesParagraph1 : Bool) (ctx : LegalContext), …`
  with no assumptions, proved by exhaustive `cases` over all 2×2 = 4 cases — a
  genuine universal proof, not a smoke test.
- No `sorry`/`admit`/`axiom`/`Classical.choice`/`unsafe` declarations.
- **D: PASS.**

## H4/C4/U4 — interpretive objection (PASS, caveat added)

- **H:** 「関税法の適用については」 does not limit the deeming to 関税法.
- **D:** the explicit scope limiter names only 関税法; collapsing all other
  statutes into `otherLaw` is faithful for this property. A global status would
  over-approximate. **PASS.**
- **U:** 関税法 art.2 defines 外国貨物 (modeled elsewhere in this repo as a
  four-valued `Verdict`). Leaving it a `Bool` is honest for the scoped claim
  "the deeming fires", but `deemedForeignGoods = false` must NOT be read as
  "not 外国貨物 under 関税法" — ordinary 関税法 classification is separate.
- **Fix (U4):** the module comment now states this explicitly.

## H5/T5/D5 — boundary theorems (PASS)

`no_deeming_under_other_law`, `no_deeming_without_paragraph1`,
`deeming_monotone_customs` (the `cases h rfl` ex-falso branch is sound), and
`agree_deemed_foreign_goods` are all correct. Transcription check present and
correct; **179/179 checks passed**. Law identity confirmed in `INVENTORY.json`.

## Adjacent artifacts (fixed by author)

- **S1 (evidence ledger):** the entry was not yet inserted at review time
  (author was holding it pending this verdict). Fixed: entry added with all 11
  axes after the verdict.
- **S2 (dead doc link):** `UNIT_…md` pointed to this adversarial doc before it
  existed. Fixed: this file created.
- **U (cosmetic):** module header `.day.12(6)` → `art.12(6)`. Fixed.

## Closing

No soundness break, wrong hash/pin, transcription error or circular proof in
the audited files. No claim of legal correctness; human legal review remains
`LEGAL_REVIEW_PENDING`.
