# Independent adversarial review — 酒税法 附則第三十八条(1)（清酒に関する特例: 15–16度 → 五十七万六百円）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; `lake build` not run by reviewer.

## Verdict: THREE CONCRETE FINDINGS — all reproduced and FIXED. Verified passes listed below.

### F1 — HIGH (FIXED): amount 576,600 → 570,600

- **H:** `taxAmountYen` should be 570,600 (五十七万六百円), not 576,600 (五十七万六千六百円).
- **T:** authoritative queue `text` codepoints after U+3000 = `五 十 七 万 六 百 円` (U+4E94 U+5341 U+4E07 U+516D U+767E U+5186) — **no U+5343 千**. Raw law: count(五十七万六千六百)=**0**, count(五十七万六百)=**3**. The 3 rate rows are 570,600 / 239,500 / 184,300 — 576,600 matches none.
- **D: FAIL.** The programmatic-injected verbatim quote was correct (五十七万六百円); the error was in the **hand-typed** model constant and its hand-written labels/docs. `amount_decoded : taxAmountYen = 576_600 := rfl` was kernel-valid but asserted the wrong statutory fact.
- **C:** the review prompt claimed 576,600, but the prompt also said "take it from the queue, NOT a typed literal" — queue + sha256-pinned source are authoritative; the typed prompt value was the error.
- **Fix applied:** `taxAmountYen := 570_600`; `amount_decoded : taxAmountYen = 570_600 := rfl`; all 五十七万六千六百円 → 五十七万六百円; all 576_600/576600 → 570_600/570600 in impl/spec/tests/audit check-name/docs. A confirmation pass found residual `¥576,600` in 5 comment/doc lines (including a self-contradictory `五十七万六百円 = 576,600`); these were fixed in a second pass (`¥576,600`/`576,600` → `¥570,600`/`570,600`). Re-verified: 0 occurrences of any wrong-value form (`576_600`, `576600`, `576,600`, `五十七万六千六百`) in impl/spec/tests/unit-doc. Hashes refreshed. Verbatim quote still byte-faithful.

### F2 — MEDIUM (FIXED): false article label 附則第三条 → 附則第三十八条

- **H:** the provision is 附則第三十八条（清酒に関する特例）, not 附則第三条.
- **T:** structural walk of `LawBody[27]/SupplProvision[3]/Article`: `attr.Num=38`, `ArticleTitle=第三十八条`, `ArticleCaption=（清酒に関する特例）`; queue `article=38`, `provision=SUPPLEMENTARY`. Genuinely different 附則第三条 articles exist elsewhere (Num=3), so this is a wrong label, not an abbreviation. Adjacent: impl header said イ一級(1) but the source row is イ特級（１）.
- **D: FAIL** (false statutory label; no kernel-proof impact).
- **Fix applied:** 附則第三条 → 附則第三十八条 in impl/spec/tests/audit check-name/unit doc; イ一級(1) → イ特級（１）. Re-verified: 0 wrong labels in unit files.

### F3 — MEDIUM (FIXED): audit check name embedded the wrong amount

- **H:** the transcription audit verifies only that the queue needle occurs in the source; its check name said "576600円" while the needle literal correctly says 五十七万六百円. The "PASS" could mislead readers into thinking the model constant was verified.
- **T:** old check name `... sake alcohol bracket 15-16deg 576600円 ...`; audit has no model-constant verification.
- **D: FAIL** (misleading check name; audit is explicitly transcription-fidelity-only, but the name embedded a false value).
- **C:** audit never promised model-constant verification; model faithfulness is verified by independent adversarial review (which is exactly what caught F1).
- **Fix applied:** check name → `... sake alcohol bracket 15-16deg 570600円 ...`. The audit remains transcription-fidelity-only by design; model constants are independently checked here. Re-verified: wrong name gone, audit 225/225.

### Verified passes (no finding)

| Check | Result |
|---|---|
| sha256 raw JSON | PASS — `01d87149…781e70` matches |
| law identity / real revision | PASS — Act, 酒税法, 昭和二十八年法律第六号, revision on disk + revision_info |
| 附則 article locator | PASS — `find_article_text("…","第三十八条")` returns None → file-kind locator genuinely required, correctly used |
| needle uniqueness / byte fidelity | PASS — count 1, U+3000 present, byte-identical to queue |
| bracket boundaries | PASS — 以上 inclusive (15 true), 未満 exclusive (16 false), 14 false |
| spec independence / axiom-freedom | PASS — negation/complement form distinct, `agree_in_bracket` universal via core lemmas, no forbidden tokens in code |

## U (residual, not a finding)

`Nat` excludes fractional degrees; the neighboring 十五度未満 row handles 一度未満の端数. For the 15≤d<16 row with integer endpoints this is a defensible, explicitly-disclosed scope simplification.

## Closing

F1/F2/F3 reproduced and fixed; all gates re-run green (725-job build, 225/225 audit, no-sorry, 4 axiom-free theorems). No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
