import JapanTaxLaw.DelegatedSavingsRate

/-!
# Independent spec — art. 72の24の2(2)二 delegated 7% rate

The spec uses a fraction pair `(7, 100)` and a two-branch conditional without
referring to `TaxRate`. Agreement is universal over the Bool designation and
all premium amounts.
-/
namespace JapanTaxLaw.DelegatedSavingsRate

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (7, 100)

def specAmount (designated : Bool) (premiumYen : Nat) : Nat :=
  if designated then premiumYen * specFraction.1 / specFraction.2 else 0

theorem agree_spec_impl (designated : Bool) (premiumYen : Nat) :
    specAmount designated premiumYen = categoryAmount designated premiumYen := by
  cases designated <;> simp [specAmount, specFraction, categoryAmount, savingsRate,
                             TaxRate.applyFloor]

example : specAmount true 1_000 = 70 := by decide
example : specAmount false 1_000 = 0 := by decide

end JapanTaxLaw.DelegatedSavingsRate
