import JapanTaxLaw.InheritanceAnnuityDeathException

/-!
# InheritanceAnnuityDeathExceptionSpec — 相続税法 art. 24(2) の独立定式

Source (pinned; identical to InheritanceAnnuityDeathException.lean):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008

Independent restatement of the art. 24(2) computable core as plain Nat
arithmetic, **not** reusing the implementation's `deathExceptionValue` /
`deathExceptionSelected` helpers:

  権利者分 + 遺族その他の第三者分      → holderAmount + thirdPartyAmount
  第三者給付がある場合のみ加算          → if b then holder + third else holder
  特例適用判定                          → diedBeforeDeadline && benefitEndedByDeath
  通常価額（第3号）との選択            → if applies then 特例値 else normalValue

All amounts are caller-established in both the implementation and this spec;
no eligibility Bool enters any money formula (Bools select which formula to use).
Scope boundaries identical to the implementation. art. 24(5) is NOT MODELLED.
-/ 

namespace JapanTaxLaw.InheritanceAnnuityDeathException

open JapanTaxLaw.TaxFinance

/-- 独立定式（実装の deathExceptionValue を呼ばない）。 -/
def specDeathExceptionValue (holderAmount thirdPartyAmount : Money) : Money :=
  holderAmount + thirdPartyAmount

/-- 独立定式: 第三者給付の有無で加算するかを選択。 -/
def specDeathExceptionSelected (thirdPartyBenefit : Bool) (holderAmount thirdPartyAmount : Money) : Money :=
  if thirdPartyBenefit then specDeathExceptionValue holderAmount thirdPartyAmount else holderAmount

/-- 独立定式: 特例適用判定。 -/
def specDeathExceptionApplies (diedBeforeDeadline benefitEndedByDeath : Bool) : Bool :=
  diedBeforeDeadline && benefitEndedByDeath

/-- 独立定式: 特例値と通常価額の選択。 -/
def specArt24_2Value
    (diedBeforeDeadline benefitEndedByDeath thirdPartyBenefit : Bool)
    (holderAmount thirdPartyAmount normalValue : Money) : Money :=
  if specDeathExceptionApplies diedBeforeDeadline benefitEndedByDeath then
    specDeathExceptionSelected thirdPartyBenefit holderAmount thirdPartyAmount
  else
    normalValue

-- 独立定式の参照点（kernel-decided）
example : specDeathExceptionValue 100 50 = 150 := by decide
example : specDeathExceptionValue 0 0 = 0 := by decide
example : specDeathExceptionSelected true 100 50 = 150 := by decide
example : specDeathExceptionSelected false 100 50 = 100 := by decide
example : specArt24_2Value true true true 100 50 999 = 150 := by decide
example : specArt24_2Value false true true 100 50 999 = 999 := by decide

-- ==== agree*（実装 ≡ 独立定式、by decide）====

private def boolPoints : List (Bool × Bool × Bool) :=
  [ (true, true, true), (true, true, false), (true, false, true),
    (false, true, true), (false, false, false), (true, false, false),
    (false, true, false) ]

private def moneyPoints : List (Money × Money × Money) :=
  [ (0, 0, 0), (100, 50, 999), (7, 3, 999), (1000, 250, 17), (1, 0, 5), (100, 0, 0) ]

private def agreeAll (f g : Bool → Bool → Bool → Money → Money → Money → Money) : Bool :=
  boolPoints.all fun bb =>
    moneyPoints.all fun mm =>
      f bb.1 bb.2.1 bb.2.2 mm.1 mm.2.1 mm.2.2 ==
      g bb.1 bb.2.1 bb.2.2 mm.1 mm.2.1 mm.2.2

/-- 加算構造の実装 ≡ 独立定式。 -/
def agreeDeathExceptionValue : Bool :=
  moneyPoints.all fun mm =>
    deathExceptionValue mm.1 mm.2.1 == specDeathExceptionValue mm.1 mm.2.1

/-- 第三者選択の実装 ≡ 独立定式。 -/
def agreeDeathExceptionSelected : Bool :=
  [false, true].all fun b =>
    moneyPoints.all fun mm =>
      deathExceptionSelected b mm.1 mm.2.1 == specDeathExceptionSelected b mm.1 mm.2.1

/-- 最上位定式の実装 ≡ 独立定式。 -/
def agreeArt24_2Value : Bool := agreeAll art24_2Value specArt24_2Value

theorem agreeDeathExceptionValue_true : agreeDeathExceptionValue = true := by decide
theorem agreeDeathExceptionSelected_true : agreeDeathExceptionSelected = true := by decide
theorem agreeArt24_2Value_true : agreeArt24_2Value = true := by decide

end JapanTaxLaw.InheritanceAnnuityDeathException
