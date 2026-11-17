import JapanTaxLaw.TaxFinance

/-!
# LocalTaxMedicalIncomeRatio — 地方税法施行令 第二十一条の八（医療施設の適用除外判定・医療収入割合がおおむね常時十分の三以下）の bounded L4 モデル

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 地方税法施行令)

原文（担当範囲・正規化済み・UTF-8）: C:\Users\junny\AppData\Local\Temp\opencode\local_order_M1.txt
（第二十一条の八、182 文字）。本モジュールの doc-comment に引用する needles は
このファイルから一字も変えず抽出したもの（pinned JSON の flatten テキストとも一致確認済み）。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  art. 21の8（法第七十二条の二十三第二項の規定を適用しない医療施設）
    「（法第七十二条の二十三第二項の規定を適用しない医療施設）第二十一条の八法第七十二条の二十三第二項に規定する政令で定めるものは、農業協同組合連合会が設置した医療施設のうち、」
    「農業協同組合連合会が設置した医療施設のうち、その支払を受ける同項に規定する金額の当該医療施設に係る医療に関する収入金額中に占める割合がおおむね常時十分の三以下」
    「当該医療施設に係る医療に関する収入金額中に占める割合がおおむね常時十分の三以下であるものとして道府県知事が認めた医療施設」
    「収入金額中に占める割合がおおむね常時十分の三以下であるものとして道府県知事が認めた医療施設その他総務省令で定める医療施設とする。」

Modelled (only the explicit statutory arithmetic and the boolean conjunction):

  * 原文の「…収入金額中に占める割合が…十分の三以下である」という算術条件を
    交差掛け（除算を避ける）で判定する:
      `medicalIncome × 10 ≤ 3 × totalIncome`
    すなわち `medicalIncome / totalIncome ≤ 3 / 10`（十分の三）。
    除算を含まないため分母 `totalIncome = 0` でも安全（停止する）。
    境界は「ちょうど 3/10 → true」「3/10 超 → false」。
  * 「おおむね常時」「道府県知事が認めた」は法的判断であり金額算術ではないため、
    caller-established の Bool（`generallyConstant` / `governorRecognized`）として受け取る。
    Bool は金額式には入れず、割合判定の Bool と `&&` で結合するのみ。
    これらは本モジュールでは認定せず、呼び出し側が担保する。

Scope & honest boundaries:

  * 割合を構成する二つの金額（分子・分母）、および原文の「同項に規定する金額」と
    「医療に関する収入金額」のどちらをどの引数に当てるかの対応づけは
    **caller-established**。本モジュールは与えられた二金額に対する算術判定のみ行う。
  * 設立体（医療施設）の該当性、法第七十二条の二十三第二項の適用の有無、
    「総務省令で定める医療施設」の具体内容、その他の政令要件は **caller-established**
    で本モデルに含めない。
  * Money = Nat。厳密な不等式のみで除算・丸めは不要（端数規則のモデル化は不要）。
  * 分母零（`totalIncome = 0`）の場合も交差掛けは `medicalIncome = 0` のとき `0 ≤ 0` となり
    停止する。この退化ケースに法的意味があるとは主張せず、入力の妥当性は caller が担保する。
  * `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.LocalTaxMedicalIncomeRatio

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 21の8 — 「十分の三以下」の割合判定と適用除外判定
-- ============================================================

/-- art. 21の8: 「…収入金額中に占める割合が…十分の三以下である」という算術条件の判定。
    分母 zero を避けるため交差掛けで判定する:
      `medicalIncome × 10 ≤ 3 × totalIncome`
    すなわち `medicalIncome / totalIncome ≤ 3 / 10`。除算を含まないため分母が零でも安全。
    境界はちょうど 3/10 で true、3/10 超で false。 -/
def medicalIncomeRatioWithin3Tenths (medicalIncome totalIncome : Money) : Bool :=
  decide (medicalIncome * 10 ≤ 3 * totalIncome)

/-- art. 21の8: 「法第七十二条の二十三第二項の規定を適用しない医療施設」の判定。
    割合判定の Bool に、caller-established の法的判断 Bool（「おおむね常時」= `generallyConstant`、
    「道府県知事が認めた」= `governorRecognized`）を `&&` で結合する。
    Bool は金額式には入れず、金額算術は `medicalIncomeRatioWithin3Tenths` に閉じ込める。
    金額の認定・法的判断はすべて caller-established。 -/
def medicalFacilityApplicationExcluded
    (medicalIncome totalIncome : Money) (generallyConstant governorRecognized : Bool) : Bool :=
  medicalIncomeRatioWithin3Tenths medicalIncome totalIncome && generallyConstant && governorRecognized

-- ==== verified facts ====

theorem medicalIncomeRatioWithin3Tenths_eq (medicalIncome totalIncome : Money) :
    medicalIncomeRatioWithin3Tenths medicalIncome totalIncome =
      decide (medicalIncome * 10 ≤ 3 * totalIncome) := rfl

/-- `medicalIncomeRatioWithin3Tenths = true` と交差掛け不等式は同値。 -/
theorem medicalIncomeRatioWithin3Tenths_true_iff (medicalIncome totalIncome : Money) :
    medicalIncomeRatioWithin3Tenths medicalIncome totalIncome = true ↔
      medicalIncome * 10 ≤ 3 * totalIncome := by
  unfold medicalIncomeRatioWithin3Tenths
  simp

theorem medicalFacilityApplicationExcluded_eq
    (medicalIncome totalIncome : Money) (generallyConstant governorRecognized : Bool) :
    medicalFacilityApplicationExcluded medicalIncome totalIncome generallyConstant governorRecognized =
      ((decide (medicalIncome * 10 ≤ 3 * totalIncome)) && generallyConstant && governorRecognized) := rfl

/-- 適用除外判定が true になるのは、割合条件・二つの法的判断がすべて true のとき。 -/
theorem medicalFacilityApplicationExcluded_true_iff
    (medicalIncome totalIncome : Money) (generallyConstant governorRecognized : Bool) :
    medicalFacilityApplicationExcluded medicalIncome totalIncome generallyConstant governorRecognized = true ↔
      ((medicalIncome * 10 ≤ 3 * totalIncome) ∧ generallyConstant = true) ∧ governorRecognized = true := by
  unfold medicalFacilityApplicationExcluded medicalIncomeRatioWithin3Tenths
  simp

-- ==== kernel-decided smoke checks ====

-- 境界: ちょうど 3/10 → true、3/10 超 → false
example : medicalIncomeRatioWithin3Tenths 3 10 = true := by decide
example : medicalIncomeRatioWithin3Tenths 4 10 = false := by decide
example : medicalIncomeRatioWithin3Tenths 30 100 = true := by decide
example : medicalIncomeRatioWithin3Tenths 31 100 = false := by decide

-- 分母零でも安全（停止する）
example : medicalIncomeRatioWithin3Tenths 0 0 = true := by decide
example : medicalIncomeRatioWithin3Tenths 1 0 = false := by decide

-- 医療収入（分子）零
example : medicalIncomeRatioWithin3Tenths 0 100 = true := by decide

-- 適用除外判定（caller-established Bool を結合）
example : medicalFacilityApplicationExcluded 3 10 true true = true := by decide
example : medicalFacilityApplicationExcluded 4 10 true true = false := by decide
example : medicalFacilityApplicationExcluded 3 10 false true = false := by decide
example : medicalFacilityApplicationExcluded 3 10 true false = false := by decide

end JapanTaxLaw.LocalTaxMedicalIncomeRatio
