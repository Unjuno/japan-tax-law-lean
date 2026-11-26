import JapanTaxLaw.TaxFinance

/-!
# LifePremiumDeduction — 3 の 生命保険料等控除 4 段階規定

Pinned 所得税法 art.76 provisions state the statutory 4-band deduction:
  ≤2万円 → full amount; 2–4万円 → 2万 + 1/2 of excess;
  4–8万円 → 3万 + 1/4 of excess; >8万円 → 4万円 ceiling.
Nat yen and Nat floor division. Eligibility and the other insurance types'
ceilings are caller-established and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.LifePremiumDeduction

def deduction (total : Nat) : Nat :=
  if total ≤ 20_000 then total
  else if total ≤ 40_000 then 20_000 + (total - 20_000) / 2
  else if total ≤ 80_000 then 30_000 + (total - 40_000) / 4
  else 40_000

example : deduction 20_000 = 20_000 := by decide
example : deduction 40_000 = 30_000 := by decide
example : deduction 80_000 = 40_000 := by decide
example : deduction 80_001 = 40_000 := by decide

end JapanTaxLaw.LifePremiumDeduction
