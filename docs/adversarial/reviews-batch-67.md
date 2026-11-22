# Adversarial review — batch 67

### PetroleumGasSenRate.lean — 石油ガス税法 第十条（税率十七円五十銭）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` かつ `attr.Num="10"` を定位（構造ヒット 3 件、本文 1 件が needle 含有）し、Sentence から原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/340AC0000000156_20260525_506AC0000000052.law.json`（Act、revision `340AC0000000156_20260525_506AC0000000052`、施行 2026-05-25、INVENTORY pin と一致）。
- SHA-256 再計算: `537d080b0297f777c2ef10a5b7439b00c09cb6dfe1c28c40fdfeac346f36f153`（生バイトから再計算、改行正規化後も同一）→ CONFIRMED。
- Article 定位: `Num="10"`、第十条（税率）、needle は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 逐語照合: needle「石油ガス税の税率は、課税石油ガス一キログラムにつき、十七円五十銭とする。」→ CONFIRMED。
- 数詞再計算: 十七 = 17、五十 = 50。`kanji_variants(17)` = {十七, 一・七}、`kanji_variants(50)` = {五十} が原文表記に直接命中 → CONFIRMED。
- スコープ判断（BY-DESIGN / CONFIRMED）: 1銭 = 1/100円 は文脈情報のみ。原文の数詞は 十七 / 五十 の二成分のみであり、規模定数（100 等）を導入すると `spec_literals` に原文未検証のリテラルが入り source verification が失敗するため、円／銭の二成分を直接 (17, 50) の一致述語としてモデル化。規模定数は NOT MODELLED。
- 境界照合 (≥3 カテゴリ): zero (0)、small_input (1)、threshold_below (16 / 49)、threshold_at (17 / 50)、threshold_above (18 / 51)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True、`boundary_evidence_categories(tests, {17,50})` = {zero, small_input, threshold_below, threshold_at, threshold_above}（≥3）、`spec_literals` = {17, 50}、`source_literals_verified` True、`review_ok` True → CONFIRMED。
- 橋渡し: agreeYen は `unfold unitYen specYen ; rfl`、agreeSen は `unfold unitSen specSen ; rfl`、agreeRate は `unfold rateMatches specRateMatches unitYen specYen unitSen specSen ; rfl`。全定数が対応本体に実在 → CONFIRMED。
- 範囲外: 課税標準、免税・税額控除、申告・納付、他の条文・号、数量スケール換算は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（第十条の明示的な二成分税率 十七円五十銭 / kg = (17, 50) のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十条「十七円五十銭」の二成分税率構造のみ。規模定数は入れない（BY-DESIGN / CONFIRMED）。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 十七→17、五十→50。rateMatches = decide (yen == unitYen && sen == unitSen)。橋渡しは純粋 `unfold ... ; rfl` のみ。
- C（整合）: true/false 選択、定数値、0/1/16/17/18/49/50/51、impl↔spec 一致を全て確認、矛盾 0。
- U（範囲外）: 課税標準・免税・申告納付・他条文・規模定数は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
