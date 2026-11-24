import JapanTaxLaw.SpecialIncomeTaxCreditCap25

/-
# SpecialIncomeTaxCreditCap25Spec — 第四十一条の十八 第二項 の独立定式

Pinned: law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013,
Article 41_18 Paragraph 2, needle 「…百分の二十五に相当する金額を超えるときは…」.

Independent restatement: the cap is 25/100 of the year's income tax, floored to
whole 100-yen units; the allowed credit is the smaller of the credit and that
cap. The definitions below use only their own numerals and do not reuse
implementation identifiers; bridge theorems are separate.
-/

namespace JapanTaxLaw.SpecialIncomeTaxCreditCap25

/-- 独立定式: 百分の二十五 = 25/100。 -/
def specNumerator : Nat := 25
def specDenominator : Nat := 100

/-- 独立定式: 端数単位 100 円未満切り捨て。 -/
def specFloorUnit : Nat := 100

/-- 独立定式: 控除限度額。impl 識別子は使わない。 -/
def specCap (tax : Nat) : Nat :=
  specFloorUnit * ((tax * specNumerator / specDenominator) / specFloorUnit)

/-- 独立定式: 控除額と上限の小さい方。 -/
def specAllowed (credit : Nat) (tax : Nat) : Nat :=
  min credit (specCap tax)

theorem agreeNumerator : rateNumerator = specNumerator := by
  unfold rateNumerator specNumerator
  rfl

theorem agreeDenominator : rateDenominator = specDenominator := by
  unfold rateDenominator specDenominator
  rfl

theorem agreeFloorUnit : floorUnitYen = specFloorUnit := by
  unfold floorUnitYen specFloorUnit
  rfl

theorem agreeCap (tax : Nat) : capAmount tax = specCap tax := by
  unfold capAmount specCap
  rw [agreeNumerator, agreeDenominator, agreeFloorUnit]

theorem agreeAllowed (credit tax : Nat) :
    allowedCredit credit tax = specAllowed credit tax := by
  unfold allowedCredit specAllowed
  rw [agreeCap]

example : specCap 400 = 100 := by decide
example : specCap 401 = 100 := by decide
example : specAllowed 80 400 = 80 := by decide
example : specAllowed 120 400 = 100 := by decide

end JapanTaxLaw.SpecialIncomeTaxCreditCap25
