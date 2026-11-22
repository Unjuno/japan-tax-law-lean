### PermitValidity7Days.lean — 酒税法施行規則 第五十条（許可状の有効期間七日超）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 酒税法施行規則 (law id 337CO0000000135), revision 337CO0000000135_20260401_507CO0000000126
- Source: data/raw/337CO0000000135_20260401_507CO0000000126.law.json
- SHA-256: d43732150ecbf2b0e12426c5a3b0289921be919480ddda742a9650cbd13986af
- Article Num: 50 — scoped 第五十条 からの verbatim needle (独立再抽出):
「許可状が七日を超える有効期間を必要とするときは、その旨及び事由」
- 7 リテラル = 七（七日）— 独立再抽出で確認。spec_literals = {7}。
- 境界カテゴリ (>=3): zero, small_input, threshold_below, threshold_at, threshold_above （いずれも kernel-decided examples）。
- 時間長のしきい値: 七日を超える = days > 7 STRICT（超える、以上ではない）。金銭・個数のしきい値ではない。
- 独立仕様: specFloor / specNeeds を実装 identifier を使わず再定義。ブリッジは `unfold ... ; rfl` のみ。
- 判定 (H/T/D/C/U): H（七日の有効期間）, T（7, STRICT >）, D（by decide/rfl）, C（clause verbatim）, U（第五十条の他部分・手続・施行規則は非介入）。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
