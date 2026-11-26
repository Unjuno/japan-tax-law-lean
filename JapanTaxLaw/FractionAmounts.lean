import JapanTaxLaw.TaxFinance

/-!
# FractionAmounts — 301 の N分のM 相当額規定

Pinned units state `N分のMに相当する金額` for 50 distinct fractions
(e.g. 二分の一, 百分の二十, 十七分の十, 百十分の百). In Japanese `N分のM`
denotes **M/N**: the number AFTER 分の is the numerator, the number BEFORE
分の is the denominator. This module computes `amount * num / den` with Nat
floor, where the caller must pass `(num = after-分の, den = before-分の)` —
the same convention as `rate_consistency.py` (百分の六 → (6,100)). An
adversarial audit found that an earlier binding reversed these arguments;
the corrected binding is documented in `data/evidence_audits/`.
The surrounding eligibility, comparisons and caps are caller-established
and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.FractionAmounts

/-- `den` 分の `num` に相当する金額（小数点以下切り捨て）。
    引数順は (金額, 分子=分の後, 分母=分の前)。 -/
def fracAmount (amount num den : Nat) : Nat := amount * num / den

example : fracAmount 100 1 2 = 50 := by decide  -- 二分の一
example : fracAmount 100 20 100 = 20 := by decide  -- 百分の二十
example : fracAmount 100 10 17 = 58 := by decide  -- 十七分の十
example : fracAmount 100 357 1000 = 35 := by decide  -- 千分の三百五十七

end JapanTaxLaw.FractionAmounts
