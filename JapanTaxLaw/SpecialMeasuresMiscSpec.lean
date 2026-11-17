import JapanTaxLaw.SpecialMeasuresMisc

/-!
# SpecialMeasuresMiscSpec — 租税特別措置法 art. 29の4 / 36 / 37の15 / 41の10 の独立定式

Sources (pinned; identical to SpecialMeasuresMisc.lean):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Independent restatement of the three modelled computations:

  * art. 41の10(1): 税額 = 金額 × 15 / 100
    impl は `TaxRate.applyFloor` 経由、spec は Nat の乗算・除算を直接書く（定式を独立に保つ）。
  * art. 36: 控除額 = if computed ≤ 50,000,000 then computed else 50,000,000
    impl は `min`、spec は場合分け（意味は同じだが定式化を独立に保つ）。
  * art. 37の15(2): 差益 = if cost ≤ proceeds then proceeds - cost else 0
    impl は saturating Nat.sub、spec は場合分け（意味は同じだが定式化を独立に保つ）。

Scope boundaries identical to the implementation. NOT MODELLED: art. 29の4, art. 37の15(1),
art. 36 の政令計算そのもの（the implementation's doc-comment explains why）.

-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- ==== independent formulas ====

/-- Spec: art. 41の10(1) 分離課税額（独立定式）。 -/
def specBenefitSupplementTax (amount : Money) : Money :=
  amount * 15 / 100

/-- Spec: art. 36 上限適用後控除額（独立定式・場合分け）。 -/
def specAssetTransferCapped (computed : Money) : Money :=
  if computed ≤ 50_000_000 then computed else 50_000_000

/-- Spec: art. 37の15(2) 認識差益（独立定式・場合分け）。 -/
def specLendingTrustGain (proceeds cost : Money) : Money :=
  if cost ≤ proceeds then proceeds - cost else 0

-- ==== points (kernel-decided) ====

example : specBenefitSupplementTax 1_000_000 = 150_000 := by decide
example : specBenefitSupplementTax 99 = 14 := by decide
example : specAssetTransferCapped 30_000_000 = 30_000_000 := by decide
example : specAssetTransferCapped 80_000_000 = 50_000_000 := by decide
example : specLendingTrustGain 10_000_000 6_000_000 = 4_000_000 := by decide
example : specLendingTrustGain 6_000_000 10_000_000 = 0 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- art. 41の10(1): impl ≡ spec。 -/
def agreeBenefitSupplementTax : Bool :=
  [0, 1, 99, 100, 1_000, 1_000_000, 33_333, 99_999_999].all fun a =>
    benefitSupplementSeparateTax a == specBenefitSupplementTax a

/-- art. 36: impl ≡ spec。 -/
def agreeAssetTransferCapped : Bool :=
  [0, 1, 30_000_000, 50_000_000, 50_000_001, 80_000_000, 999_999_999].all fun c =>
    assetTransferDeductionCapped c == specAssetTransferCapped c

/-- art. 37の15(2): impl ≡ spec。 -/
def agreeLendingTrustGain : Bool :=
  [ (10_000_000, 6_000_000), (6_000_000, 10_000_000), (5_000, 5_000),
    (0, 0), (1, 0), (0, 1), (100, 99), (7, 8) ].all fun (p, c) =>
    lendingTrustGain p c == specLendingTrustGain p c

example : agreeBenefitSupplementTax = true := by decide
example : agreeAssetTransferCapped = true := by decide
example : agreeLendingTrustGain = true := by decide

end JapanTaxLaw
