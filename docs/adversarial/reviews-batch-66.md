# Adversarial review — batch 66

### ConditionalApprovalFee.lean — コンテナーに関する通関条約及び国際道路運送手帳による担保の下で行なう貨物の国際運送に関する通関条約（ＴＩＲ条約）の実施に伴う関税法等の特例に関する法律施行令 第十七条（コンテナーの承認手数料：十二万七百円／電子申請 十一万千八百円）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` かつ `attr.Num="17"` を定位（構造ヒット 1 件）し、Item 内 Sentence から原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/346CO0000000257_20171008_428CO0000000240.law.json`（CabinetOrder、revision `346CO0000000257_20171008_428CO0000000240`、施行 2017-10-08）。
- SHA-256 再計算: `24fe53fb7ff3bb0a896e8110ead0fab89807e8ea9c62ccc1472e5b12771b4c74`（生バイトから再計算、改行正規化後も同一、INVENTORY の pin と一致）→ CONFIRMED。
- Article 定位: `Num="17"`、Caption（コンテナーの承認手数料）、第十七条 第二号（型式承認）→ CONFIRMED。
- 逐語照合: needle「当該承認一件ごとに十二万七百円（電子申請の場合にあつては、十一万千八百円）」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 十二万七百円 = 120,700、十一万千八百円 = 111,800。`kanji_variants` が双方の原文表記に直接命中 → CONFIRMED。
- 条件構造: 標準 120,700 円を電子申請のみ 111,800 円へ低減する Bool 選択型であり、しきい値・比率モデルではないことを impl・spec 双方で確認 → CONFIRMED。
- 境界照合 (≥3 カテゴリ): zero (0)、small_input (1)、threshold_below (120699 / 111799)、threshold_at (120700 / 111800)、threshold_above (120701 / 111801)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True、`boundary_evidence_categories(tests, {120700,111800})` = {zero, small_input, threshold_below, threshold_at, threshold_above}（≥3）、`spec_literals` = {120700, 111800}、`source_literals_verified` True、`review_ok` True → CONFIRMED。
- 橋渡し: agreeStandard は `unfold standardFee specStandard ; rfl`、agreeElectronic は `unfold electronicFee specElectronic ; rfl`、agreeFee は `unfold feeFor specFee standardFee specStandard electronicFee specElectronic ; rfl`。unfold リストの全定数は対応本体に実在 → CONFIRMED。
- 見出し修正: queue ラベル「コンテナー関税政令」は短縮形であり、pinned `law_title` の正式名は異なる。見出しを正式名に修正（内容は同一法令）→ BY-DESIGN / CONFIRMED。
- 範囲外: 第一号（九千三百円／八千七百円）、徴収手続、他の条文・号、非 Bool 入力は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（第十七条の明示的な条件付き手数料構造 — 標準 120,700 円／電子申請 111,800 円、一件ごと — のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十七条 第二号の「十二万七百円（電子申請の場合にあつては、十一万千八百円）」の明示的条件構造のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 十二万七百→120700、十一万千八百→111800。feeFor = if electronic then 111800 else 120700。橋渡しは純粋 `unfold ... ; rfl` のみ。
- C（整合）: true/false 選択、定数値、低減不等式、0/1/120699/120700/120701/111799/111800/111801、impl↔spec 一致を全て確認、矛盾 0。
- U（範囲外）: 第一号・徴収手続・他条文・非 Bool 入力は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
