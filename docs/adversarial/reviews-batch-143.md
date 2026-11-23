# Adversarial Review — batch 143

## Scope
Mechanically generated review (NOT a human review): every check below was re-run by script against the pinned snapshot and the in-tree detectors; no human judgement is claimed.

### RankedAmountCountTen.lean — 高額適用額 第六条（順位十件目までの算定）

- 独立再抽出 (independent re-extraction): law id 422M60000040022, revision 422M60000040022_20260731_508M60000040041, source data/raw/422M60000040022_20260731_508M60000040041.law.json. law_info law_type = MinisterialOrdinance (省令).
- SHA-256 re-computed: 950d67e96e5219efae8f4540695ec98dc7caf97c460fa0812ffe118d90cb4472 — 照合 / FOUND against the pinned raw snapshot (byte-identical).
- Article Num 6 (第六条): scoped article text located (740 chars); unit anchor found verbatim in that article.
- Needle (verbatim): 「この場合において、同号に規定する高額適用額は、その順位を付した適用額が十以上となるまでの適用額に順位を付した場合の第一順位から当該十以上となる順位までに該当する各適用額（第一順位の適用額が十以上となるときは、当該第一順位の適用額）とする。」
- Literal (1, source-verified): 10 (十); parse_statutory_rate(scoped) = None; source_literals_verified({10}, scoped) = True.
- COUNT-CUTOFF semantics: ranking continues UNTIL 十以上 (n >= 10, INCLUSIVE at 10); the ranked amounts from rank 1 through the rank where the count reaches 10 are used; if the first-ranked amount alone is 十以上, that single amount is used. Distinct from floors, caps and ratios.
- Boundary categories (>=3): zero (0), small_input (9), threshold_below (9), threshold_at (10), threshold_above (11) — 判定 CONFIRMED via generate_verification_evidence.boundary_evidence_categories(tests, {10}).
- 独立抽出 of spec: specCutoff=10, specReaches with no implementation identifiers; spec_literals = {10}; independent_spec_ok = True.
- Verdict: BY-DESIGN / CONFIRMED — only the explicit numeric count cutoff is modelled; the ranking procedure, amount computation, 同号 definition and other provisions are out of scope.
- H/T/D/C/U — H（健全性）: needle and SHA independently re-extracted from the pinned snapshot; T（真正性）: kanji 十 / 十以上 confirmed verbatim; D（判別）: inclusive count cutoff distinct from floors, caps and ratios; C（網羅）: zero, small_input and all three threshold categories; U（用途）: 順位を付した適用額の数 → n >= 10 predicate only.
- Mechanical-not-human note: produced by scripted re-extraction and detector calls; this is not a human attestation.
