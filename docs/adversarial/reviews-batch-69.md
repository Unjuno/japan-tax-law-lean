# Adversarial review — batch 69

### TobaccoRatePerThousand.lean — たばこ税法 第十一条（税率千本につき六千八百二円）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` かつ `attr.Num="11"` を定位し、原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/359AC0000000072_20260525_506AC0000000052.law.json`（たばこ税法、law id `359AC0000000072`、revision `359AC0000000072_20260525_506AC0000000052`）。
- SHA-256 再計算: `6079422da9d83bb97d68e5fd824b92563d7a0e183cabdf88fc0d9e0cd241e2cd`（生バイト、改行正規化後も同一）→ CONFIRMED。
- Article 定位: `Num="11"`、第十一条、scoped 文本 151 字、needle は当該 Article 内に verbatim 1 回 → FOUND / CONFIRMED。
- 逐語照合: needle「たばこ税の税率は、千本につき六千八百二円とする。」→ CONFIRMED。
- 数詞再計算: 六千八百二 = 6802、千 = 1000。`kanji_variants(6802)` に 六千八百二、`kanji_variants(1000)` に 千 が直接命中 → CONFIRMED。
- スコープ判断（BY-DESIGN / CONFIRMED）: 第一項の明示的な率 6802 円/1000 本のみをモデル化。本数が 1000 で割り切れる場合（0/1000/2000 本）は厳密な円額、割り切れない本数は Nat の切捨て（floor division）を採用する — BY-DESIGN / CONFIRMED。第二項の税率 14424 円/千本、課税標準、認定、附則は NOT MODELLED。
- 境界照合 (≥3 カテゴリ): zero (0)、small_input (1, 2)、threshold_below (999 = 1000-1)、threshold_at (1000)、threshold_above (1001 = 1000+1)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True、`boundary_evidence_categories(tests, {6802,1000})` = {zero, small_input, threshold_below, threshold_at, threshold_above}（≥3）、`spec_literals` = {6802, 1000}、`source_literals_verified` True、`review_ok` True → CONFIRMED。
- 橋渡し: agreeRate は `unfold ratePerThousand specRate ; rfl`、agreeUnit は `unfold unitCount specUnit ; rfl`、agreeTax は `unfold taxFor specTax ratePerThousand specRate unitCount specUnit ; rfl`。全定数が対応本体に実在 → CONFIRMED。
- 範囲外: 第二項の特例税率、課税標準の認定、申告・納付、他条文・号は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（第十一条第一項の明示的な率 6802 円/1000 本のみをモデル化。全 H で通過、矛盾 0）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十一条「千本につき六千八百二円」の税率構造のみ。floor division の切捨て採用は BY-DESIGN / CONFIRMED。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 六千八百二→6802、千→1000。taxFor = cigarettes * 6802 / 1000。橋渡しは純粋 `unfold ... ; rfl` のみ。
- C（整合）: 定数値、0/1/999/1000/1001/2000、impl↔spec 一致（agreeRate/agreeUnit/agreeTax）を全て確認、矛盾 0。
- U（範囲外）: 第二項の特例税率、課税標準の認定、申告納付、他条文は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
