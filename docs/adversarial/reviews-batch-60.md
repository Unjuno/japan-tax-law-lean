# Adversarial review — batch 60（機械的独立クロスチェック）

### ForestTaxEligibilityException.lean — 森林環境税法 第四条（非課税対象者の所得制限）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、pinned 生 JSON を自前 Python で直接読み、自前 walker で `tag=Article` & `attr.Num="4"` を定位・正規化（`[\s\u3000]+` 除去）。repo 外の一時スクリプトのみ使用、repo 未変更、Lean 未実行。
- 一次資料: `data/raw/431AC0000000003_20260401_508AC0000000002.law.json`（124,407 bytes）SHA-256 `b854d3c0e79d4141f03d053f2bedce95934c26f32a8508324a742dc384edfcf4` を独立再計算（INVENTORY `raw_snapshot.source_sha256` と一致）→ CONFIRMED。law_id `431AC0000000003`, revision `431AC0000000003_20260401_508AC0000000002`, 施行 2026-04-01 を照合。
- Article 定位: `Num="4"` を 2 件検出。main provision `law_full_text/children/1/children/2/children/1/children/1/children/3`（正規化本文 393 文字）に needle 1 回。同番号の附則 Article も LOCATED 1（BY-DESIGN、非モデル化）。
- 逐語照合: 針「障害者、未成年者、寡婦又はひとり親（これらの者の当該年度の初日の属する年の前年（次号において「前年」という。）の合計所得金額が百三十五万円を超える場合を除く。）」は scoped 本文に verbatim 1 回（全文でも 1 回）→ CONFIRMED。
- 数詞: 百三十五万円 = 135 × 10^4 = 1,350,000 円。「超える」= > 1,350,000 が EXCLUSIVE exclusion → income ≤ 1,350,000 が INCLUSIVE ceiling。`kanji_variants(1350000)` に `百三十五万` を含み `source_literals_verified({1350000}, scoped)` True → CONFIRMED。
- 境界（独立再計算 ≥3 カテゴリ）: below 1_349_999 → true；at 1_350_000 → true；above 1_350_001 → false；zero 0 → true、small 1 → true、一般 0 → false。by-decide 全件を Python シミュレーションし矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specCeiling/specCategory/specEligible を自記述、spec 式に impl 識別子なし）、`spec_literals`={1350000}、`boundary_evidence_categories(tests,{1350000})`={zero, small_input, saturation, threshold_below, threshold_at, threshold_above}（3 threshold カテゴリすべて）、`source_literals_verified` True → CONFIRMED。
- 橋渡し（axiom-free, 完全形）:
  ```lean
  theorem agreeCeiling : incomeCeiling = specCeiling := by unfold incomeCeiling specCeiling; rfl
  theorem agreeCategory (c : String) : isQualifyingCategory c = specCategory c := by unfold isQualifyingCategory specCategory; rfl
  theorem agreeEligible (c : String) (income : Nat) : eligible c income = specEligible c income := by
    unfold eligible specEligible isQualifyingCategory specCategory incomeCeiling specCeiling
    rfl
  ```
  純 `unfold ... ; rfl` のみ。by_cases / omega / Classical.choice / 追加公理なし → CONFIRMED。
- 範囲外: 各区分の地方税法第292条による定義、前年の算定、生活保護扶助（第一号）、政令で定める金額（第三号）、他条項・附則、司法判断は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な四区分と百三十五万円の所得制限のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第四条第二号の「障害者、未成年者、寡婦又はひとり親」＋「合計所得金額が百三十五万円を超える場合を除く」の明示構造のみ。
- T（逐語性）: 自前再抽出の針が main provision に verbatim 1 回、SHA-256 再計算が pin と一致。
- D（導出）: 百三十五万円 → 1_350_000 円、超える = > 1_350_000 を除外 → ≤ 1_350_000 が適格。impl と spec は同一演算子を各定数で記述し、3 つの agree*（純 rfl）が普遍橋渡し。
- C（整合）: 0/1/1_349_999/1_350_000/1_350_001 および 4 区分＋一般で impl=spec、全境界一致、矛盾 0。
- U（範囲外）: 各区分の定義・扶助・政令額・他条項・法的判断は NOT MODELLED。

補正記録（BY-DESIGN / CONFIRMED）:
1. 同番号 Article が 2 件あるため main provision を選択（附則の同名 Article は BY-DESIGN/CONFIRMED）。
2. 本記録は機械的検証（再抽出・SHA-256 再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
