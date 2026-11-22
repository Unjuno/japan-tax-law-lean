# Adversarial review — batch 65

### MonthCountExclusiveBand.lean — 法人特別税法 第七条（指定期間内の月数の範囲外除外）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` かつ `attr.Num="7"` を定位（構造ヒット 1 件、全文 1 回）し、Paragraph 内 Sentence から原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/404AC0000000015_20010401_413AC0000000006.law.json`（法人特別税法、revision `404AC0000000015_20010401_413AC0000000006`、施行 2001-04-01）。見出し・doc-comment の法 id / revision / source はすべてこの pinned スナップショットと一致 → BY-DESIGN / CONFIRMED。
- SHA-256 再計算: `603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8`（生バイト 74185 から再計算、改行正規化後も同一、doc-comment 記載値と一致）→ CONFIRMED。
- Article 定位: `Num="7"`、第七条 → CONFIRMED。
- 逐語照合: needle「事業年度の変更その他の事由により、指定期間内に終了する事業年度の月数の合計が二十四月に満たない法人及び当該月数の合計が二十四月を超える法人（次号から第五号までに掲げる法人を除く。）」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 二十四月 = 24。`kanji_variants(24)` が原文の「二十四」（当該 Article 内 2 回）に直接命中 → CONFIRMED。
- 除外構造: 月数合計が 24 未満 (`months < 24`) または 24 超 (`24 < months`) のとき除外、それ以外（==24）のみ該当。片側しきい値ではなく両側の exclusive band / exact-match 構造であることを impl・spec 双方で確認 → CONFIRMED。
- 境界照合 (≥3 カテゴリ): zero (0)、small_input (1,12)、threshold_below (23)、threshold_at (24)、threshold_above (25,48)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specBand と独自定式 specExcluded/specQualifies を持ち、独立 def に impl 識別子なし）、`boundary_evidence_categories(tests, {24})` = {zero, small_input, threshold_below, threshold_at, threshold_above}（≥3）、`spec_literals` = {24}、`source_literals_verified({24}, scoped)` True、`review_ok` True → CONFIRMED。
- 橋渡し: agreeBand / agreeExcluded / agreeQualifies は純粋 `unfold ... ; rfl`。agreeExcluded は `unfold excludedByMonthCount specExcluded bandValue specBand ; rfl`、agreeQualifies は `unfold qualifiesByMonthCount specQualifies excludedByMonthCount specExcluded bandValue specBand ; rfl`。unfold リストの全定数は対応本体に実在 → CONFIRMED。
- 範囲外: 第一号〜第五号の列挙・適用期間・課税標準・他の条文・非 Nat 入力は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（第七条の明示的な範囲外除外構造 — 24 未満 OR 24 超を除外、ちょうど 24 月のみ該当 — のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第七条の「二十四月に満たない」「二十四月を超える」の明示的な両側範囲外構造のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 二十四月→24。excluded = (months<24 || 24<months)、qualifies = !excluded ⇔ months==24。橋渡しは純粋 `unfold ... ; rfl` のみで公理を導入しない。
- C（整合）: 0/1/12/23/24/25/48 の除外・該当ペア、境界 (23/24/25)、impl↔spec 一致を全て確認、矛盾 0。
- U（範囲外）: 第一号〜第五号・適用期間・課税標準・他条文・非 Nat 入力は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
