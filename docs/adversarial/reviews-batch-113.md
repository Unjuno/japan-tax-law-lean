# Adversarial review — batch 113

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for ShareMajority50.lean and its Spec/Tests modules. Every claim
below is reproducible from committed bytes.

### ShareMajority50.lean — 租税特別措置法施行令 第十六条の十二（持分百分の五十超）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 租税特別措置法施行令 (law id 344M50000048001),
  revision 344M50000048001_20260601_508M60000048004.
- Source: data/raw/344M50000048001_20260601_508M60000048004.law.json
- SHA-256: 16f478fac8e3f64e3bda43d638c4fc98bfd8f5747af82b4e2321ac0648a8b0fe
  (SHA-256 照合 OK; 独立再抽出でバイト一致, BYTES 1100908).
- Article Num: 16_12 (第十六条の十二). 独立再抽出で scoped article を取得し、needle
  verbatim 1 箇所一致を照合。
- Needle verbatim in scoped Article 16の12:
  「当該他の準組合の準組合財産に対する持分の割合が百分の五十を超える場合における当該持分」
- Statutory literals: 50 = 五十 (threshold numerator), 100 = 百分 (per-hundred
  denominator). parse_statutory_rate(scoped) = Fraction(1, 2);
  source_literals_verified({50, 100}, scoped) = True; spec_literals(spec) = {50, 100}.
- STRICT inequality confirmed: 超える = STRICTLY > 50, NOT 以上. p = 50 does NOT
  qualify; p = 51 qualifies. The 1/3 quorum is a distinct norm and is NOT modelled.
- 境界カテゴリ (5 >= 3): zero (0), small_input (1), threshold_below (49),
  threshold_at (50, 100), threshold_above (51) — all kernel-decided examples,
  verified by boundary_evidence_categories(tests, {50, 100}).
- 独立仕様: specMajority/specScale/specExceeds contain no implementation identifiers;
  independent_spec_ok(spec, impl) = True; bridges are pure `unfold ... ; rfl` only
  (agreeMajority, agreeScale, agreeExceeds).
- 判定 (H/T/D/C/U): H（第十六条の十二の明示的閾値「百分の五十を超える」, STRICT 超える）,
  T（50 = 五十, 100 = 百分, 1/2 rate; bytes pinned by SHA-256）,
  D（rfl / by decide のみ; 単一引数バインダ, 他の証明戦術なし）,
  C（needle verbatim, source_literals_verified True, 5 boundary categories,
     spec independence + agreements confirmed）,
  U（準組合・持分の定義, 他の号, 1/3 基準, 算定・適用場面は非介入; 数値閾値のみ）.
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
