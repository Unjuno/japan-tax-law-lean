# Independent adversarial review — 酒税法 附則第八条(3)1（税額 十万円以下 → 二月 保存期間）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; no build run by reviewer.

## Verdict: 2 concrete findings (F1 false law name, F2 hand-typed gloss) — reproduced and FIXED. All other checks PASS.

### F1 — false statutory law name in spec header (関税法 vs 酒税法) — FIXED

- **H:** `CustomsTaxRetentionPeriodTier1Spec.lean:4,6` named the law `関税法` (Customs Act).
- **T:** authoritative law id `328AC0000000006` = `酒税法` (Liquor Tax Act, INVENTORY `official_title` + raw `revision_info.law_title`); 関税法 is a different law (昭和二十九年法律第六十一号). The impl (`:8`) and unit doc already said `酒税法` (injected from INVENTORY) → spec internally inconsistent. The task brief's own "Law: 関税法" was likewise false.
- **D: FAIL** (false statutory label in spec).
- **Fix applied:** spec header 関税法 → 酒税法 (2×); re-verified 0 remaining. Spec hash refreshed.
- **C/U (non-finding):** the English module identifier `CustomsTaxRetentionPeriodTier1.*` and ASCII audit check name are a cosmetic misnomer for a 酒税法 norm; identifiers are arbitrary code names, not statutory labels, and the check name remains ASCII-only as required. Acknowledged, not changed.

### F2 — hand-typed prose gloss 千円以下 vs 十万円以下 — FIXED

- **H:** `CustomsTaxRetentionPeriodTier1.lean:18` hand-typed gloss said `千円以下` ("¥1,000 or less").
- **T:** modeled ceiling is 十万円 = ¥100,000 (`taxAmountCeilingYen := 100_000`, correct); 千円以下 was wrong by ×100.
- **D: FAIL** (hand-typed label error; documentation-only — kernel constants correct).
- **Fix applied:** 千円以下 → 十万円以下 in impl prose; re-verified 0 remaining 千円以下. Impl hash refreshed.

### Verified passes (no finding)

| Check | Result |
|---|---|
| sha256 | PASS — `01d87149…781e70` matches claim |
| needle byte fidelity | PASS — full-width space U+3000 present; Lean quote & audit literal byte-equal to queue; whole-law count 1 |
| law number/type/caption | PASS — 昭和二十八年法律第六号, Act, caption （手持品課税） byte-exact |
| numerics | PASS — 十万円 = 100,000 (NOT 千万), 二月 = 2, both derived programmatically; all forms agree |
| 附則 file-kind locator | PASS — `find_article_text("第八条")` returns 360-char MainProvision article without needle; file locator required |
| proofs | PASS — successor-strict spec distinct from ≤; `agree_within_tier` universal & axiom-free; boundaries 100k/100,001; period_decoded rfl; no forbidden constructs in code |
| audit / duplicates | PASS — ASCII-only check name; no duplicate impl |

Gates re-run green after fixes: 821-job build, 257/257 audit, no-sorry.

## Closing

F1/F2 reproduced and fixed; no formalization defect remains. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
