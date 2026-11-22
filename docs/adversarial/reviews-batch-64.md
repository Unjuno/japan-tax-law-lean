# Adversarial review — batch 64

### SpecialTonSplitRatio.lean — 特別とん税法 第五条（特別とん税ととん税の按分）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` かつ `attr.Num="5"` を定位（構造ヒット 1 件、全文 1 回）し、Paragraph 内 Sentence から原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/332AC0000000038_20250601_504AC0000000068.law.json`（law_type=Act、revision `332AC0000000038_20250601_504AC0000000068`、施行 2025-06-01、CurrentEnforced）。見出し・doc-comment の法 id / revision / source はすべてこの pinned スナップショットと一致 → BY-DESIGN / CONFIRMED。
- SHA-256 再計算: `5bfed8c6c85b2803e3987df079cb731532df32b2f2bce061afd1ab2e255c9669`（生バイト 38210 から再計算、改行正規化後も同一、doc-comment 記載値と一致）→ CONFIRMED。
- Article 定位: `Num="5"`、第五条 → CONFIRMED。
- 逐語照合: needle「特別とん税及びとん税の納付があつたときは、その納付に係る金額の三十六分の二十に相当する税額の特別とん税及び三十六分の十六に相当する税額のとん税の納付があつたものとする。」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算（三リテラル）: 三十六 = 36（共通分母）、二十 = 20（特別とん税の分子）、十六 = 16（とん税の分子）。`kanji_variants` が原文の「三十六」「二十」「十六」に直接命中 → CONFIRMED。
- 分割構造: 二十 + 十六 = 三十六（20 + 16 = 36）。specialShare = amount*20/36、tonShare = amount*16/36。36 の倍数では 2 つの share の和が amount に等しい (partition of unity) → CONFIRMED。
- 範囲仮定: 36 で割り切れない金額の端数処理は原文が明示せず、本モデルは 36 | amount にのみ完全性を主張（BY-DESIGN / CONFIRMED、caller-established）。0・1・5 等の非倍数でも Nat 除算は total。
- 境界照合 (≥3 カテゴリ): zero (0)、small_input (1,5)、threshold_below (15,19,35)、threshold_at (16,20,36)、threshold_above (17,21,37)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specDenom/specSpecialNum/specTonNum と独自定式 specSpecialShare/specTonShare を持ち、独立 def に impl 識別子なし）、`boundary_evidence_categories(tests, {36,20,16})` = {zero, small_input, threshold_below, threshold_at, threshold_above, saturation}（≥3）、`spec_literals` = {36,20,16}、`source_literals_verified({36,20,16}, scoped)` True、`review_ok` True → CONFIRMED。
- 橋渡し: agreeDenom / agreeSpecialNum / agreeTonNum は純粋 `unfold ... ; rfl`。agreeSpecialShare は `unfold specialShare specSpecialShare splitDenominator specDenom specialNum specSpecialNum ; rfl`、agreeTonShare は `unfold tonShare specTonShare splitDenominator specDenom tonNum specTonNum ; rfl`。unfold リストの全定数は対応本体に実在 → CONFIRMED。
- 範囲外: 納付の事実認定・金額認定・他の条文・端数処理・非 Nat 入力は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（第五条の明示的な按分構造 — 共通分母 36、特別とん税 20、とん税 16、20+16=36 — のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第五条の「三十六分の二十」「三十六分の十六」の明示的な按分数値構造のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 三十六→36、二十→20、十六→16。impl・spec いずれも同式、橋渡しは純粋 `unfold ... ; rfl` のみで公理を導入しない。
- C（整合）: 0/36/360/720 の按分と和、15/16/17/19/20/21/35/37 の境界、impl↔spec 一致を全て確認、矛盾 0。
- U（範囲外）: 事実認定・他条文・端数処理・非 Nat 入力は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
