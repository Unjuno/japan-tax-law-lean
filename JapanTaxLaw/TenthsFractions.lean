import JapanTaxLaw.TaxFinance

/-!
# TenthsFractions — 13 の 十分のN 相当額規定

Pinned units state 十分のNに相当する金額 for N ∈ {1,2,5,7,9}.
The implementation computes `amount * N / 10` with floor. A unit originally
tokenized as 十分の百 was found by independent adversarial review to read
百十分の百 (100/110) in the pinned source; it is modelled in the separate
`FractionRates110` module. The surrounding eligibility conditions are
caller-established and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.TenthsFractions

def tenths1 (a : Nat) : Nat := a / 10
def tenths2 (a : Nat) : Nat := a * 2 / 10
def tenths5 (a : Nat) : Nat := a * 5 / 10
def tenths7 (a : Nat) : Nat := a * 7 / 10
def tenths9 (a : Nat) : Nat := a * 9 / 10
example : tenths1 123 = 12 := by decide
example : tenths2 123 = 24 := by decide
example : tenths5 123 = 61 := by decide
example : tenths7 123 = 86 := by decide
example : tenths9 123 = 110 := by decide

end JapanTaxLaw.TenthsFractions
