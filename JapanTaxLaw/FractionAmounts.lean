import JapanTaxLaw.TaxFinance

/-!
# FractionAmounts — 301 の N分のM 相当額規定

Pinned units state `N分のMに相当する金額` for 50 distinct fractions
(e.g. 二分の一, 百分の二十, 十七分の十, 百十分の百). This module computes
the exact amount as `amount * numerator / denominator` with Nat floor.
The surrounding eligibility, comparisons and caps are caller-established
and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.FractionAmounts

/-- `den` 分の `num` に相当する金額（小数点以下切り捨て）。 -/
def fracAmount (amount num den : Nat) : Nat := amount * num / den

example : fracAmount 100 1 2 = 50 := by decide
example : fracAmount 100 20 100 = 20 := by decide
example : fracAmount 100 10 17 = 58 := by decide

end JapanTaxLaw.FractionAmounts
