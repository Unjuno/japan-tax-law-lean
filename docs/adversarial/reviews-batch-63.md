# Adversarial review — batch 63

### LiquorDegreeSteppedAmount.lean — 酒税法 第二十三条（アルコール分に応じ加算額）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` かつ `attr.Num="23"` を定位（`law_full_text/children/1/children/3/children/2/children/2`、構造ヒット 1 件）し、Paragraph 内 Sentence から原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/328AC0000000006_20260525_506AC0000000052.law.json`（law_type=Act、revision `328AC0000000006_20260525_506AC0000000052`）。見出し・doc-comment の法 id / revision / source はすべてこの pinned スナップショットと一致 → BY-DESIGN / CONFIRMED。
- SHA-256 再計算: `01d87149a80f64fa70d8b6eafffead6341982d902c4d206630cbc3f91c781e70`（生バイト 657678 から再計算、doc-comment 記載値と一致）→ CONFIRMED。
- Article 定位: `Num="23"`、第二十三条 → CONFIRMED。
- 逐語照合: needle「二十万円（アルコール分が二十一度以上のものにあつては、二十万円にアルコール分が二十度を超える一度ごとに一万円を加えた金額）」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算（四リテラル）: 二十万円 = 200000（base）、二十一度 = 21（以上＝包含）、二十度 = 20（を超える＝厳密に上限超）、一万円 = 10000（超過 1 度ごと）。`kanji_variants` が原文の「二十万」「二十一」「二十」「一万」に直接命中 → CONFIRMED。
- 加算構造: fee(degrees) = 200000 + (degrees - 20) * 10000（degrees >= 21）、それ以外は 200000。21 を包含するのは「二十一度以上」の逐語に従う → CONFIRMED。
- 境界照合 (≥3 カテゴリ): zero (feeFor 0 → 200000)、small_input (1,5,19)、threshold_below (L-1 = 20 → 200000)、threshold_at (L = 21 → 210000)、threshold_above (L+1 = 22 → 220000)、large (30 → 300000)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specBase/specQualifying/specFloor/specPer と独自定式 specFee を持ち、独立 def に impl 識別子なし）、`boundary_evidence_categories(tests, {200000,21,20,10000})` = {zero, small_input, threshold_below, threshold_at, threshold_above}（≥3）、`spec_literals` = {200000,21,20,10000}、`source_literals_verified({200000,21,20,10000}, scoped)` True、`review_ok` True → CONFIRMED。
- 橋渡し: agreeFee は `unfold feeFor specFee baseAmount specBase qualifyingDegree specQualifying degreeFloor specFloor perDegreeAmount specPer` + `rfl`。4 定数の agree 定理も純粋 `unfold ... ; rfl`。unfold リストの全定数はfeeFor/specFee 本体に実在し、追加公理なしのカーネル橋渡し → CONFIRMED。
- 範囲外: 酒税法の他の条文・免許要件・課税標準・他の酒類区分・非 Nat のアルコール分は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（第二十三条の明示的な段階加算数値構造 — base 200000 円、21 度以上で 20 度超過 1 度ごとに 10000 円加算 — のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二十三条の「二十万円（アルコール分が二十一度以上のものにあつては、二十万円にアルコール分が二十度を超える一度ごとに一万円を加えた金額）」の明示的数値構造のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 二十万円→200000、二十一度→21（包含）、二十度→20（厳密超過）、一万円→10000。impl・spec いずれも同式、橋渡しは純粋 `unfold ... ; rfl` のみで公理を導入しない。
- C（整合）: 0/20/21/22/30 および 1/5/19 の by-decide 例、impl↔spec 一致を全て確認、矛盾 0。
- U（範囲外）: 他条文・免許要件・他酒類区分・非 Nat 入力は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
