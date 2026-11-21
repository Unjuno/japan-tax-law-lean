# Adversarial review — batch 52

### PopulationInterval15M75M.lean — 航空機燃料譲与税法施行規則 第四条 (law 347M50000008026)

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、一時 Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="4"` を定位（`/law_full_text/children[1]/children[2]/children[3]/children[4]`、構造ヒット 1 件）し、needle の葉を逐語照合。実行後に一時スクリプトは破棄。
- 一次資料: `data/raw/347M50000008026_20250905_507M60000008091.law.json`（航空機燃料譲与税法施行規則, MinisterialOrdinance, 昭和四十七年自治省令第二十六号, revision 347M50000008026_20250905_507M60000008091, enforcement 2025-09-05, 改正 令和七年総務省令第九十一号）。
- メタデータ修正: 指示の `..._20250601_504AC0000000068` と「酒類業組合等施行令」は tree 内に存在せず、inventory の current_enforced スナップショットは上記 20250905 版・上記タイトル（law id 347M50000008026 は一致）。実在する一次資料を pin した → BY-DESIGN / CONFIRMED。
- SHA-256 再計算: `7304e9a98c078d84b5ca2468a5e9932313ffe49e0bf90b40a75371822418b75c`（生バイトから再計算、inventory と一致）→ CONFIRMED。
- Article 定位: `Num="4"`、第四条、Caption （空港関係市町村に係る延べ重量及び旅客数並びに世帯数の補正）、Paragraph 3 の旅客数区分表 TableRow 6 → CONFIRMED。
- 逐語照合: needle「千五百万人を超え七千五百万人以下の人数」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 万/億対応 converter で `int_to_kanji(15_000_000) = 千五百万`、`int_to_kanji(75_000_000) = 七千五百万`。両者とも needle に verbatim 含有。`source_literals_verified({15000000,75000000}, clause)` = True（scoped article でも True）→ CONFIRMED。
- 境界 (≥3 カテゴリ): zero (0 → false)、small_input (1,2,13 → false)、lower (15,000,000 → false / 15,000,001 → true, 超え = strict)、upper (75,000,000 → true / 75,000,001 → false, 以下 = inclusive)、saturation/identity (`15_000_000 - 15_000_000 = 0` 等)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specLow/specHigh と独立 def、impl 識別子なし）、`spec_literals` = {15000000, 75000000}（両方含有）、`boundary_evidence_categories` = {zero, small_input, saturation}（≥3）、`review_ok` True → CONFIRMED。
- 橋渡し: `unfold inPopulationInterval specInInterval popLow popHigh specLow specHigh` の後 `rfl` のみ。同一演算子・同一リテラルで両辺は定義的に等しく、by_cases/omega/Classical.choice や追加公理なし → CONFIRMED。
- 範囲外: 他の人数レンジ（十二万人以下、三百万人超え千五百万人以下、七千五百万人超え）、率 〇・五、空港別補正、他条項は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的数値区間 15,000,000 < p <= 75,000,000 のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第四条 Paragraph 3 の「千五百万人を超え七千五百万人以下の人数」の明示的数値区間のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 千五百万人 = 1500万 = 15M（超え = strict >）、七千五百万人 = 7500万 = 75M（以下 = inclusive <=）。impl/spec とも `decide (low < p && p <= high)`。
- C（整合）: 0/1/2/13 → false、15,000,000 → false、15,000,001 → true、75,000,000 → true、75,000,001 → false、impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 他の人数レンジ、率、空港補正、他条項、実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
