### RegistrationFeePerItem.lean — 登録免許税法 第十四条（担保付社債がない場合の一件千五百円）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 登録免許税法 (law id 342AC0000000035), revision 342AC0000000035_20261101_508AC0000000021
- Source: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
- SHA-256: 95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15
- Article Num: 14 — verbatim needle (独立再抽出):
「この場合において、当該担保付社債の金額がないときは、当該登録免許税の課税標準及び税率は、当該登記又は登録に係る不動産等に関する権利の件数一件につき千五百円とする。」
- 1500 リテラル = 千五百（一件につき千五百円）— 独立再抽出で確認。
- 境界カテゴリ (>=3): zero, small_input, threshold_below, threshold_at, threshold_above （いずれも kernel-decided examples）。
- 独立仕様: specFee / specFeeFor を実装 identifier を使わず再定義。spec_literals = {1500}。
- 別表 (appendix table) の手数料は他モジュールでモデル化。本規則（第十四条・一件千五百円）はそれとは別個の規定であり、混同しない。
- 判定 (H/T/D/C/U): H=千五百円/件, T=1500, D=by decide/rfl, C=clause verbatim, U=他モジュールの別表とは非介入。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
