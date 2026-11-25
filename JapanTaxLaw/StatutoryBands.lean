import JapanTaxLaw.TaxFinance

/-!
# StatutoryBands — 2 の pinned 段階控除規定 (所得税法 art.28 / art.86)

Art.28 給与所得控除: five bands with a base plus a rate on the excess.
Art.86 基礎控除: five bands with fixed amounts decreasing to zero.

The model computes both with Nat arithmetic (floor division). The surrounding
eligibility and 別表第五 exception in art.28 are caller-established and NOT
MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.StatutoryBands

/-- 給与所得控除額 (art.28), 収入金額 ∈ Nat 円. -/
def salaryDeduction (income : Nat) : Nat :=
  if income ≤ 1_900_000 then 650_000
  else if income ≤ 3_600_000 then 650_000 + (income - 1_900_000) * 30 / 100
  else if income ≤ 6_600_000 then 1_160_000 + (income - 3_600_000) * 20 / 100
  else if income ≤ 8_500_000 then 1_760_000 + (income - 6_600_000) * 10 / 100
  else 1_950_000

/-- 基礎控除額 (art.86), 合計所得金額 ∈ Nat 円. -/
def basicDeduction (totalIncome : Nat) : Nat :=
  if totalIncome ≤ 23_500_000 then 580_000
  else if totalIncome ≤ 24_000_000 then 480_000
  else if totalIncome ≤ 24_500_000 then 320_000
  else if totalIncome ≤ 25_000_000 then 160_000
  else 0

example : salaryDeduction 1_900_000 = 650_000 := by decide
example : salaryDeduction 3_600_000 = 1_160_000 := by decide
example : salaryDeduction 6_600_000 = 1_760_000 := by decide
example : salaryDeduction 8_500_000 = 1_950_000 := by decide
example : basicDeduction 23_500_000 = 580_000 := by decide
example : basicDeduction 25_000_000 = 160_000 := by decide
example : basicDeduction 25_000_001 = 0 := by decide

end JapanTaxLaw.StatutoryBands
