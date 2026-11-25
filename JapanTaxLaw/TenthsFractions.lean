import JapanTaxLaw.TaxFinance

/-!
# TenthsFractions — 13 の 十分のN 相当額規定

Pinned units state 十分のNに相当する金額 for N ∈ {1,2,5,7,9,100}.
The implementation computes `amount * N / 10` with floor. The surrounding
eligibility conditions are caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.TenthsFractions

def tenths1 (a : Nat) : Nat := a / 10
def tenths2 (a : Nat) : Nat := a * 2 / 10
def tenths5 (a : Nat) : Nat := a * 5 / 10
def tenths7 (a : Nat) : Nat := a * 7 / 10
def tenths9 (a : Nat) : Nat := a * 9 / 10
def tenths100 (a : Nat) : Nat := a * 100 / 10

example : tenths1 123 = 12 := by decide
example : tenths2 123 = 24 := by decide
example : tenths5 123 = 61 := by decide
example : tenths7 123 = 86 := by decide
example : tenths9 123 = 110 := by decide
example : tenths100 123 = 1230 := by decide

end JapanTaxLaw.TenthsFractions
