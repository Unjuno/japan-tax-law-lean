# Adversarial review — batch 54

### WeightInterval5M25M.lean — 航空機燃料譲与税法施行規則 第四条（重量）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、一時 Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="4"` を定位（構造ヒット 1 件）、needle の葉を逐語照合。Article 4 の Paragraph#2（TableStruct→Table→TableRow→TableColumn→Sentence#1 の文字葉）に命中。個数区間は Paragraph#3 の別セルであり混同しない。実行後に一時スクリプトは破棄。
- 一次資料: `data/raw/347M50000008026_20250905_507M60000008091.law.json`（航空機燃料譲与税法施行規則, MinisterialOrdinance, 昭和四十七年自治省令第二十六号, revision 347M50000008026_20250905_507M60000008091, `current_revision_status=CurrentEnforced`）。
- SHA-256 再計算: `7304e9a98c078d84b5ca2468a5e9932313ffe49e0bf90b40a75371822418b75c`（生バイト 123325 から再計算、pin と一致）→ CONFIRMED。
- Article 定位: `Num="4"`（第四条）、Paragraph#2 の table cell → CONFIRMED。
- 逐語照合: needle「五百万トンを超え二千五百万トン以下の重量」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 五百万トン = 500万 = 5,000,000（STRICT 超え）、二千五百万トン = 2500万 = 25,000,000（INCLUSIVE 以下）。万/億対応 `int_to_kanji` が 5_000_000→五百万, 25_000_000→二千五百万 を確認。impl `weightLow/weightHigh`・spec `specLow/specHigh` とも一致。`source_literals_verified` = True → CONFIRMED。
- 境界 (≥3 カテゴリ): below (<5M): 0,1,2,13 → false；at low (=5M): 5,000,000 → false（超え）；above low: 5,000,001 → true；at high (=25M): 25,000,000 → true（以下）；above high: 25,000,001 → false；saturation `25_000_000-25_000_000=0`。impl↔spec 一致（境界グリッドと普遍定理 `agreeInterval w`）。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 `specLow/specHigh` と impl と同じ演算子 `decide (specLow < w && w <= specHigh)` を独自に記述、spec 式に impl 識別子なし）、`spec_literals` = {5000000, 25000000}（両方含有）、`boundary_evidence_categories` ≥3、`source_literals_verified` True → CONFIRMED。
- 橋渡し（厳密な証明）:
  ```
  theorem agreeInterval (w : Nat) : inWeightInterval w = specInInterval w := by
    unfold inWeightInterval specInInterval weightLow weightHigh specLow specHigh
    rfl
  ```
  純粋な `rfl` のみ（6 定数 unfolding 後は両辺同じカーネル項、演算子・リテラル同一）。by_cases/omega/Classical.choice/追加公理なし → CONFIRMED。
- 範囲外: 同条の他の重量区分・旅客数区間（Paragraph#3）・世帯数区間・率・他項・他条項は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的数値区間のみをモデル化: `5,000,000 < w <= 25,000,000`。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第四条 Paragraph#2 table cell の「五百万トンを超え二千五百万トン以下の重量」の明示的数値区間のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 五百万トン = 5M（超え = strict `<`）、二千五百万トン = 25M（以下 = inclusive `<=`）。impl と spec は同一演算子を独自定数で記述。
- C（整合）: 5,000,000 → false；5,000,001・25,000,000 → true；25,000,001 → false；impl↔spec 一致を `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 他区分（旅客数・世帯数・重量の他セル）、率、他条項、実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・SHA-256 再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
