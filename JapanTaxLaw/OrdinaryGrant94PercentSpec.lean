import JapanTaxLaw.OrdinaryGrant94Percent

/-!
# Independent spec — 地方交付税法 art. 6の2(2) 94% grant

The spec computes from the `(94, 100)` fraction without using `TaxRate`.
Agreement is universal over every base amount.
-/
namespace JapanTaxLaw.OrdinaryGrant94Percent

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (94, 100)

def specTotal (baseYen : Nat) : Nat :=
  baseYen * specFraction.1 / specFraction.2

theorem agree_spec_impl (baseYen : Nat) : specTotal baseYen = ordinaryGrantTotal baseYen := by
  simp [specTotal, specFraction, ordinaryGrantTotal, grantRate, TaxRate.applyFloor]

example : specTotal 10_000 = 9_400 := by decide

end JapanTaxLaw.OrdinaryGrant94Percent
