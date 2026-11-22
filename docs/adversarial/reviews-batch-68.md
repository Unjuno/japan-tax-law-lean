# Adversarial review — batch 68

### LocalCorpRate93_907.lean — 地方法人税法 第二十四条の三（税率九百七分の九十三）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` かつ `attr.Num="24_3"` を定位し、原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/426AC0000000011_20260401_507AC0000000013.law.json`（地方法人税法、law id `426AC0000000011`、revision `426AC0000000011_20260401_507AC0000000013`、施行 2026-04-01）。
- SHA-256 再計算: `263518e159c906bc45a83fe41ed57b5816387363e03d97e2697da5ef71c14ed2`（生バイトから再計算、改行正規化後も同一）→ CONFIRMED。
- Article 定位: `Num="24_3"`、第二十四条の三、needle は当該 Article 内に verbatim 1 回 → FOUND / CONFIRMED。
- 逐語照合: needle「国際最低課税額等に係る特定基準法人税額に対する地方法人税の額は、各課税対象会計年度の課税標準国際最低課税法人税額に九百七分の九十三の税率を乗じて計算した金額とする。」→ CONFIRMED。
- 数詞再計算: 九十三 = 93、九百七 = 907。`kanji_variants(93)` に 九十三、`kanji_variants(907)` に 九百七 が直接命中 → CONFIRMED。
- スコープ判断（BY-DESIGN / CONFIRMED）: 原文の明示的な法定分数 九百七分の九十三 = 93/907 のみをモデル化。Nat の乗算→除算は floor division（切捨て）を与えるが、原文は金額（円）を返すため切捨てをそのまま採用。厳密性が必要な場合は base が 907 で割り切れる場合（907, 1814）に限定して解釈する — BY-DESIGN / CONFIRMED。規模定数・他条文は NOT MODELLED。
- 境界照合 (≥3 カテゴリ): zero (0)、small_input (1)、threshold_below (906 = 907-1)、threshold_at (907)、threshold_above (908 = 907+1)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True、`boundary_evidence_categories(tests, {93,907})` = {zero, small_input, threshold_below, threshold_at, threshold_above}（≥3）、`spec_literals` = {93, 907}、`source_literals_verified` True、`review_ok` True → CONFIRMED。
- 橋渡し: agreeNum は `unfold rateNumerator specNum ; rfl`、agreeDen は `unfold rateDenominator specDen ; rfl`、agreeTax は `unfold taxFor specTax rateNumerator specNum rateDenominator specDen ; rfl`。全定数が対応本体に実在 → CONFIRMED。
- 範囲外: 国際最低課税額等の算定、課税対象会計年度の判定、免税・税額控除、申告・納付、他条文・号は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（第二十四条の三の明示的な法定分数 九百七分の九十三 = 93/907 のみをモデル化。全 H で通過、矛盾 0）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二十四条の三「九百七分の九十三」の税率構造のみ。floor division の切捨て採用は BY-DESIGN / CONFIRMED。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 九十三→93、九百七→907。taxFor base = base * 93 / 907。橋渡しは純粋 `unfold ... ; rfl` のみ。
- C（整合）: 定数値、0/1/906/907/908/1814、impl↔spec 一致（agreeNum/agreeDen/agreeTax）を全て確認、矛盾 0。
- U（範囲外）: 課税標準の算定・年度判定・免税・申告納付・他条文は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
