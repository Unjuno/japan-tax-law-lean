# Adversarial review — batch 46

### DisasterReliefPenalty.lean — 災害被害者租税減免法 第五条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="5"` を定位（構造ヒット 1 件）・原文照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/329AC0000000112_20250601_504AC0000000068.law.json`（law 329AC0000000112, revision 329AC0000000112_20250601_504AC0000000068, enforcement 2025-06-01）。
- SHA-256 再計算: `e9fdb7f3e8e12c43d255f747e2533f5374b31454e03efd513bfe1f4c12d35943`（生バイト 49804 バイト）→ CONFIRMED。
- Article 定位: `Num="5"` を構造走査で 1 件検出 → CONFIRMED。
- 逐語照合: needle「第一項の規定による承認を受けないで同項の資材等又は製品等を譲り受けた者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」は当該 Article ノード内に verbatim 1 回、原文全体でも 1 回（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 一年 = 1 年（impl `imprisonmentCeiling`/spec `specImprisonment` = 1）、五十万円 = 500000 円（impl `fineCeiling`/spec `specFine` = 500_000）。原文に「一年」「五十万」「五十万円」が各 1 回以上 verbatim 存在 → CONFIRMED。
- 境界照合 (≥3): 拘禁刑 0 年 → true、1 年 → true、2 年 → false；罰金 0 円 → true、499999 円 → true、500000 円 → true、500001 円 → false。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specImprisonment=1・specFine=500000 と被演算子反転 `¬ spec* < x` のみで impl 識別子なし）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {500000}（1 は構造的数値として除外）、`source_literals_verified` True（五十万 を原文より直接照合）→ CONFIRMED。
- 橋渡し: 普遍定理 agreeImprisonment / agreeFine は unfold 後の純粋 `simp [Nat.not_lt]`（Nat.not_lt により `¬ 1 < y` → `y <= 1`、`¬ 500000 < v` → `v <= 500000`）。by_cases / omega / Classical.choice / propext を用いない axiom-free のカーネル橋渡し → CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な二つの刑の上限 一年 = 1 年・五十万円 = 500000 円と、それぞれの 「以下」 = inclusive <= のみをモデル化。二つの軸は次元が異なり混用しない。承認要件・資材等／製品等の定義・譲受人・実際の量刑・他条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第五条の「一年以下の拘禁刑又は五十万円以下の罰金に処する。」という二つの明示的数値上限のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 一年 → 1（年）、五十万円 → 500000（円）。spec は `<` 否定の独自定数・独自被演算子を持ち、普遍的 `simp [Nat.not_lt]` のみでカーネル橋渡し。
- C（整合）: 0/1/2 年、0/499999/500000/500001 円、impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 承認要件・資材等／製品等の定義・譲受人・量刑・実数・負の値（Nat 前提）・軸の混用・他条項は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。pinned JSON の `revision_info.law_title` 表示と unit 名に相違があるが、law_id / revision / Article Num / needle の一致が抽出の決め手であり数値・文言の抽出には影響しない。
