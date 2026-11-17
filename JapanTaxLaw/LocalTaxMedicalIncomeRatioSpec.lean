import JapanTaxLaw.LocalTaxMedicalIncomeRatio

/-!
# LocalTaxMedicalIncomeRatioSpec — 地方税法施行令 第二十一条の八 の独立定式

Sources (pinned; identical to LocalTaxMedicalIncomeRatio.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

Independent restatement of the modelled computation:

  * art. 21の8「割合が十分の三以下」
      impl: `decide (medicalIncome * 10 ≤ 3 * totalIncome)`
      spec: `decide (3 * totalIncome ≥ medicalIncome * 10)`
    — 同じ判定を「左辺と右辺を入れ替え、`≤` を `≥` にした」形で書き直し、定式を独立に保つ。
    `agreeMedicalIncomeRatioWithin3Tenths` は有限サンプル上の `==` 一致確認であり、
    法的意味の等価証明ではない。
  * 適用除外判定の spec も impl と同じ caller-established Bool を同じ順序で `&&` するが、
    割合部分は上記の独立定式（`specMedicalIncomeRatioWithin3Tenths`）を用いる。

Scope boundaries identical to the implementation. 金額の認定・該当性・法的判断は
すべて caller-established で NOT MODELLED（impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.LocalTaxMedicalIncomeRatio

open JapanTaxLaw.TaxFinance

-- ==== independent formula ====

/-- Spec: art. 21の8 の「十分の三以下」判定（独立定式）。
    impl の `medicalIncome * 10 ≤ 3 * totalIncome` を
    `3 * totalIncome ≥ medicalIncome * 10` と書き換えた形。 -/
def specMedicalIncomeRatioWithin3Tenths (medicalIncome totalIncome : Money) : Bool :=
  decide (3 * totalIncome ≥ medicalIncome * 10)

/-- Spec: art. 21の8 の適用除外判定（独立定式）。
    割合部分に spec を用い、二つの法的判断 Bool は caller-established として受け取る。 -/
def specMedicalFacilityApplicationExcluded
    (medicalIncome totalIncome : Money) (generallyConstant governorRecognized : Bool) : Bool :=
  specMedicalIncomeRatioWithin3Tenths medicalIncome totalIncome && generallyConstant && governorRecognized

-- ==== points (kernel-decided) ====

-- 境界: ちょうど 3/10 → true、3/10 超 → false
example : specMedicalIncomeRatioWithin3Tenths 3 10 = true := by decide
example : specMedicalIncomeRatioWithin3Tenths 4 10 = false := by decide
example : specMedicalIncomeRatioWithin3Tenths 30 100 = true := by decide
example : specMedicalIncomeRatioWithin3Tenths 31 100 = false := by decide
-- 分母零・医療収入零
example : specMedicalIncomeRatioWithin3Tenths 0 0 = true := by decide
example : specMedicalIncomeRatioWithin3Tenths 1 0 = false := by decide
example : specMedicalIncomeRatioWithin3Tenths 0 100 = true := by decide

-- ==== agreement checks between implementation and Spec ====

/-- art. 21の8: impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeMedicalIncomeRatioWithin3Tenths : Bool :=
  [ (0, 0), (1, 0), (0, 100), (3, 10), (4, 10), (30, 100), (31, 100),
    (3, 1), (299_999, 1_000_000), (300_000, 1_000_000), (300_001, 1_000_000) ].all fun (m, t) =>
      medicalIncomeRatioWithin3Tenths m t == specMedicalIncomeRatioWithin3Tenths m t

example : agreeMedicalIncomeRatioWithin3Tenths = true := by decide

/-- art. 21の8: 適用除外判定の impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeMedicalFacilityApplicationExcluded : Bool :=
  [ (3, 10, true, true), (4, 10, true, true), (3, 10, false, true),
    (3, 10, true, false), (30, 100, true, true), (31, 100, true, true),
    (0, 0, true, true), (1, 0, true, true), (0, 100, true, true) ].all fun (m, t, g, r) =>
      medicalFacilityApplicationExcluded m t g r == specMedicalFacilityApplicationExcluded m t g r

example : agreeMedicalFacilityApplicationExcluded = true := by decide

end JapanTaxLaw.LocalTaxMedicalIncomeRatio
