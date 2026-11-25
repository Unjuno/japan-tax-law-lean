import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReduction — 災害被害者に対する租税の減免等に関する法律 第2条

A 3-band reduction of the income tax amount by total income:
  ≤ 500万円 → 全部 (the whole tax)
  ≤ 750万円 → 十分の五
  > 750万円 → 十分の二・五 (= 25/100 = 1/4)

`tax` and `income` are Nat yen; the returned value is the reduced amount.
Disaster-victim eligibility and the other taxes in the same article are
caller-established and NOT modelled. Not legal advice.
-/

namespace JapanTaxLaw.DisasterTaxReduction

def reductionAmount (tax income : Nat) : Nat :=
  if income ≤ 5_000_000 then tax
  else if income ≤ 7_500_000 then tax * 5 / 10
  else tax * 25 / 100

example : reductionAmount 1_000_000 5_000_000 = 1_000_000 := by decide
example : reductionAmount 1_000_000 7_500_000 = 500_000 := by decide
example : reductionAmount 1_000_000 7_500_001 = 250_000 := by decide

end JapanTaxLaw.DisasterTaxReduction
