# Independent adversarial review — 国際観光旅客税法 art. 15 unit

Reviewer: an independent agent session (no shared working context with the
author). All checks were read-only. The reviewer re-walked the pinned JSON,
recomputed its digest, ran the transcription audit, and read the Lean and docs.

No files were edited by the reviewer; the fixes below were applied by the author
after the findings were reported.

## Finding 1 — Needle uniqueness / article scoping: PASS

- **H:** The needle occurs once, in 第十五条; 「三千円」 also occurs once in the pinned file.
- **T:** Full-file counts on the pinned JSON: needle=1, 三千円=1. Walked all 27 main articles; only 第十五条 contains the needle. `find_article_text` uses exact `title == "第十五条"` and is confined to `MainProvision`.
- **D:** PASS.
- **C:** 「三千円」 occurs in other laws (登録免許税法 etc.), so a repo-wide numeric match could mislocate the constant; within this pin it is unique. The docs' caution is therefore repo-wide, not a live risk for this pin — corrected in the C cell.
- **U:** The audit needle omits the trailing 「。」 present in the "Verbatim" line. Harmless for substring matching; the strings are not literally identical.

## Finding 2 — Independent spec / universality: PASS

- **H:** Spec is a different formulation; proof is universal.
- **T:** Implementation `n * 3_000`; spec `specSum` primitive recursion; `agree_international_tourist_tax` uses `induction departures`. The finite `[0,1,2,3,10,50]` check is a separate labelled Bool.
- **D:** PASS.
- **C:** Independence is in *form* only — the constant 3,000 is hardcoded in both modules. The transcription audit does not mechanically bind the Lean literal (repo-wide limitation).
- **U:** `departures : Money` (yen type) is used for a dimensionless count (回); the contract is documented, not type-enforced.

## Finding 3 — No unsound placeholders; honest boundary/cross-law: PASS

- **H:** No `sorry`/`admit`/`axiom`; boundary/cross-law theorems prove only what they claim.
- **T:** Grep found only a doc-comment mention. Boundary theorems are `rfl`/`by decide`/`Nat.mul_le_mul_right`. `cross_law_source_collected` evaluates a closed `match` in `TaxGeneral.lean`. Axiom probe: `agree_international_tourist_tax` depends on `propext` only (standard axiom, widespread in this repo); `specSum_zero` and `taxForDepartures_mono` depend on no axioms; no `sorryAx`, no `Classical.choice`.
- **D:** PASS, with the qualification below.
- **C:** The cross-law theorem's name/comment originally overstated the claim — it evaluates a local Bool classifier rather than re-deriving the legal classification from 国税通則法. **Fixed:** the comment now states this modeling boundary explicitly.
- **U:** The reviewer did not independently audit the 国税通則法 art. 2(2) source pin.

## Finding 4 — Scope citations: FAIL (fixed)

- **H:** The "NOT modelled" list accurately cites the pinned article text.
- **T:** Compared the docs/Lean citations against dumped article texts:
  - 「art. 15(3)(ii) 特別徴収」 does not exist — 第十五条 is a single sentence. 特別徴収 is imposed by 第十六条/第十七条; the category is defined in 第二条第一項第七号.
  - 「the exemptions in art. 3」 is wrong — 第三条 is 「人格のない社団等に対するこの法律の適用」. The 非課税 provisions are 第六条 and the 第五条 proviso.
  - The H cell claimed linearity unqualified, but tax attaches only to taxable departures.
  - A garbled fragment 「が let/不得超过 adjustments」 appeared in the docs U cell.
- **D:** FAIL at review time. **Fixed:** all three citations corrected in `InternationalTouristTaxUnit.lean`, `InternationalTouristTaxUnitSpec.lean` and `docs/UNIT_INTERNATIONAL_TOURIST_TAX_15.md`; linearity qualified to taxable departures; garbled fragment removed.
- **C:** The omissions were disclosed, but the disclosures pointed to wrong articles, which would mislead a reader checking the pinned source.
- **U:** The reviewer did not exhaustively verify every other "NOT modelled" bullet.

## Finding 5 — Pinning and article locator: PASS

- **H:** Correct revision/digest and `find_article_text("第十五条")`.
- **T:** Recomputed SHA-256 `486f27e…ead5ec` matches the inventory (case-insensitively); pin metadata matches; check tuple at `transcription_audit.py` uses law 430AC0000000016 / 第十五条; audit reports 160/160.
- **D:** PASS.
- **C:** The audit verifies only that the source string exists; there is no mechanical link to the Lean constant (changing 3_000 to 3001 would not fail). Repo-wide limitation.
- **U:** The `NORM|4cd756…` id is not `sha256(verbatim)` but derives from a 15-component canonical tuple in `normative_core.py`; not independently reconstructible from the doc alone. Not flagged as fabricated.

## Verdict

Core transcription, universal proof, kernel soundness and pinning survive
independent challenge. All factual scope-citation defects were reproduced and
corrected. `adversarial_review` evidence is recorded only after these fixes.
No claim of legal correctness; human legal review remains pending.
