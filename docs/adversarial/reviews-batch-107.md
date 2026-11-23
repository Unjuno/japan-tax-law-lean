# Adversarial review — batch 107

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for AviationFuelThousandRoundDown.lean and its Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### AviationFuelThousandRoundDown.lean — 航空機燃料譲与税法 第四条（千円未満端数切捨て）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 航空機燃料譲与税法 (law id 347AC0000000013), revision 347AC0000000013_20240401_506AC0000000004
- Source: data/raw/347AC0000000013_20240401_506AC0000000004.law.json
- SHA-256: 83ec3090a44c6100c8915c0aaef57c3aeb45ea9067538531b6e7d8e447411288 (SHA-256 照合 OK; 独立再抽出で一致)
- Article Num: 4 (第四条). 独立再抽出で 1 structural hit、needle verbatim 1 箇所一致を照合。
- Needle verbatim in scoped Article 4:
  「各空港関係市町村及び空港関係都道府県に対する前条第一項に規定する各譲与時期ごとに譲与すべき航空機燃料譲与税の額として前三条の規定を適用して計算した金額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該各譲与時期ごとに譲与すべき航空機燃料譲与税の額とする。」
- Statutory literal: 1000 = 千（千円未満の端数金額, 千円単位への切捨て, INCLUSIVE/EXACT at 1000 multiples）;
  independent spec defines {1000}; generator spec_literals() = {1000};
  source_literals_verified({1000}) True (千 in scoped 原文).
- 境界カテゴリ (6 >= 3): zero (0), small_input (1), threshold_below (999),
  threshold_at (1000), threshold_above (1001), saturation (0/1000 results) —
  all kernel-decided examples, verified by boundary_evidence_categories(tests, {1000}).
- 独立仕様: specUnit / specRound defined without implementation identifiers;
  bridges are pure `unfold ... ; rfl` only (agreeUnit, agreeRound).
- 判定 (H/T/D/C/U): H（航空機燃料譲与税法 第四条の明示的端数処理「千円未満の端数金額を控除」）, T（1000 = 千円; INCLUSIVE/EXACT at multiples; bytes pinned by SHA-256）, D（rfl / by decide のみ、Nat 除算・乗算の reduction）, C（needle verbatim, literal source-verified, 6 boundary categories, spec independence confirmed）, U（前三条の算定・配分・譲与時期は非介入、ROUNDING ノルムのみをモデル化）.
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
