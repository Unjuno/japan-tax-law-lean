import JapanTaxLaw.GiftAnnualExemption

/-!
# GiftAnnualExemptionSpec — independent spec for 相続税法 art. 21の11の二(1)

Source (pinned; identical to GiftAnnualExemption.lean):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Independent restatement:

  spec: 控除後課税価格 = if price ≤ 600000 then 0 else price - 600000

  The implementation uses a named limit constant and saturating Nat subtraction;
  this spec restates the same computation with an inline literal and an explicit
  branch, without referencing any implementation definition in its definitional
  section. Scope boundaries are identical to the implementation (paragraph 2 is
  a delegation to a cabinet order and is not modelled).

The `agree*` helper below is comparison scaffolding, not part of the spec.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 六十万円控除後の課税価格（独立定式）。 -/
def specGiftAnnualExemptionBase (price : Money) : Money :=
  if price ≤ 600_000 then 0 else price - 600_000

-- ==== kernel-decided points ====

example : specGiftAnnualExemptionBase 0 = 0 := by decide
example : specGiftAnnualExemptionBase 600_000 = 0 := by decide
example : specGiftAnnualExemptionBase 600_001 = 1 := by decide
example : specGiftAnnualExemptionBase 1_000_000 = 400_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeGiftAnnualExemptionBase : Bool :=
  [0, 1, 599_999, 600_000, 600_001, 611_012, 13_000_000].all fun price =>
    giftAnnualExemptionBase price == specGiftAnnualExemptionBase price

example : agreeGiftAnnualExemptionBase = true := by decide

end JapanTaxLaw
