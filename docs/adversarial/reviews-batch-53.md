# Adversarial review — batch 53

### AreaThreshold2Ha.lean — 区域面積二ヘクタール以上 第三条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、一時 Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="3"` を定位（構造ヒット 1 件、Paragraph#1/Item#2）し、needle の葉を逐語照合。実行後に一時スクリプトは破棄。
- 一次資料: `data/raw/348AC0000000102_20010106_411AC0000000160.law.json`（特定市街化区域農地の固定資産税の課税の適正化に伴う宅地化促進臨時措置法, Act, 昭和四十八年法律第百二号, revision 348AC0000000102_20010106_411AC0000000160, enforcement 2001-01-06, `current_revision_status=CurrentEnforced`）。
- メタデータ照合/修正: queue selector (`_sel800.json`) と `INVENTORY.json` も同 revision・同タイトル・同 source_file で一致し、stale 項目なし。修正不要（pin は実在する current_enforced スナップショット）→ BY-DESIGN / CONFIRMED。
- SHA-256 再計算: `1aff9700ac6c8028a1901fc056959c771fb539c1c40da205f498bab4f67a063b`（生バイトから再計算、inventory の大文字表記と一致）→ CONFIRMED。
- Article 定位: `Num="3"`（第三条）、Item#2 の `当該区域の面積が二ヘクタール以上であること。` → CONFIRMED。
- 逐語照合: needle「当該区域の面積が二ヘクタール以上であること」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 二 = 2、ヘクタール = ha、以上 = INCLUSIVE `>=`。impl `areaFloor=2` / spec `specFloor=2`。`source_literals_verified` = True（scoped article でも True）→ CONFIRMED。
- 境界 (≥3 カテゴリ): below (<2): 0,1 → false；at (=2): 2 → true；above (>2): 3,4,10,39 → true；saturation/identity `2-2=0`。impl↔spec 一致（0/1/2/3/10 と普遍定理 `agreeArea x`）。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 `specFloor` と `decide (¬ ha < specFloor)` という impl と異なる演算子、spec 式に impl 識別子なし）、`spec_literals` = {2}（二を含有）、`boundary_evidence_categories` ≥3、`source_literals_verified` True → CONFIRMED。
- 橋渡し（厳密な証明）:
  ```
  theorem agreeArea (ha : Nat) : meetsAreaFloor ha = specMeets ha := by
    unfold meetsAreaFloor specMeets areaFloor specFloor
    simp [Nat.not_lt]
  ```
  `simp [Nat.not_lt]` のみ（`Nat.not_lt`: `¬ ha < 2` → `2 <= ha`）。by_cases/omega/Classical.choice/追加公理なし → CONFIRMED。
- 範囲外: 同条の他閾値（一ヘクタール = 1 ha、十ヘクタール = 10 ha）、事業計画要件、率、他項・他条項は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的数値閾値のみをモデル化: `ha >= 2` INCLUSIVE。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第三条 Item#2 の「当該区域の面積が二ヘクタール以上であること」の明示的数値閾値のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 二ヘクタール = 2 ha、以上 = inclusive `>=`。impl は `decide (ha >= 2)`、spec は `decide (¬ ha < 2)`（異なる演算子、同値）。
- C（整合）: 0,1 → false；2,3,4,10,39 → true；impl↔spec 一致を `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 他閾値（1 ha, 10 ha）、事業計画、率、他条項、実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・SHA-256 再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
