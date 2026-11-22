# Adversarial review — batch 70

### FiscalYearMonthProration.lean — 法人特別税法 第九条（課税事業年度が一年に満たない場合の按分）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` かつ `attr.Num="9"` を定位し原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/404AC0000000015_20010401_413AC0000000006.law.json`（法人特別税法、law id `404AC0000000015`、revision `404AC0000000015_20010401_413AC0000000006`）。
- SHA-256 再計算: `603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8`（生バイト、改行正規化後も同一）→ CONFIRMED。
- Article 定位: `Num="9"`、第九条、scoped 文本 1213 字、needle は当該 Article 内に verbatim 1 回 → FOUND / CONFIRMED。
- 逐語照合: needle「課税事業年度が一年に満たない法人に対する前項の規定の適用については、同項中「年四百万円」とあるのは、「四百万円を十二で除し、これに当該課税事業年度の月数を乗じて計算した金額」とする。」→ CONFIRMED。
- 数詞再計算: 四百万 = 4,000,000、十二 = 12。scoped 原文に 四百万 および 十二 が直接命中 → CONFIRMED。
- 算術順序（BY-DESIGN / CONFIRMED）: 原文は「十二で除し、これに…月数を乗じて」と除算を先に記述。したがってモデルも `(4,000,000 / 12) * months` と除算→乗算の順を厳守する。4,000,000 / 12 = 333,333（Nat の切り捨て）のため 12 月でも 3,999,996 円となるが、この端数は整数演算の帰結であり、法が別途の丸め規則を定めたという主張ではない。
- 境界照合 (≥3 カテゴリ): zero (0)、small_input (1, 6)、threshold_below (11 = 十二-1)、threshold_at (12)、threshold_above (13 = 十二+1)、saturation (結果 0)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True、`spec_literals` = {4000000, 12}、`source_literals_verified` True、`boundary_evidence_categories(tests, {4000000,12})` = {zero, small_input, saturation, threshold_below, threshold_at, threshold_above}（≥3）、`review_ok` True → CONFIRMED。
- 橋渡し: agreeAnnual は `unfold annualAmount specAnnual ; rfl`、agreeMonths は `unfold monthsPerYear specMonths ; rfl`、agreeProrated は `unfold proratedFor specProrated annualAmount specAnnual monthsPerYear specMonths ; rfl`。全定数が対応本体に実在 → CONFIRMED。
- 範囲外: 前項（第二項）の税率そのもの、第三項以降、第四項の特例、附則・経過措置は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（第九条の明示的な按分算術のみをモデル化。全 H で通過、矛盾 0）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第九条第三項の「四百万円を十二で除し、これに月数を乗じて計算した金額」の按分構造のみ。除算→乗算の順序と切捨て採用は BY-DESIGN / CONFIRMED。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 四百万→4,000,000、十二→12。proratedFor = (annualAmount / monthsPerYear) * months。橋渡しは純粋 `unfold ... ; rfl` のみ。
- C（整合）: 定数値、0/1/6/11/12/13、impl↔spec 一致（agreeAnnual/agreeMonths/agreeProrated）を全て確認、矛盾 0。
- U（範囲外）: 前項の税率、第三項以降、第四項の特例、附則・経過措置は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
