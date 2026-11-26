import JapanTaxLaw.TaxFinance

/-!
# DecimalMultipliers — 70 の 小数乗数 相当額規定

Pinned provisions state 「額に一・五を乗じて得た額」 etc. The multiplier is a
Japanese decimal written directly (e.g. 一・五 = 15/10, 〇・九五 = 95/100),
so the amount is `base * num / den`. All 20 distinct multipliers are positive
rationals; Nat floor division is used. The base amount and any rounding are
caller-established and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.DecimalMultipliers

def scaledAmount (base num den : Nat) : Nat := base * num / den

example : scaledAmount 100 15 10 = 150 := by decide
example : scaledAmount 100 95 100 = 95 := by decide
example : scaledAmount 100 105 100000 = 0 := by decide

end JapanTaxLaw.DecimalMultipliers
