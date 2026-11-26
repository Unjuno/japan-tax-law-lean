import JapanTaxLaw.TaxFinance

/-!
# ThresholdDeductions — 4 の 所得区分別定額控除

Two pinned deduction tables from 所得税法/地方税法:
- 配偶者控除: income ≤900万 → 38万 (elder 48万); ≤950万 → 26万 (32万);
  ≤1000万 → 13万 (16万); above → 0.
- 旧長期損害保険料控除: ≤1万 → full; 1–2万 → 1万 + 1/2 of excess;
  above 2万 → 1.5万 ceiling.
Eligibility of the spouse / contract type is caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.ThresholdDeductions

def spouseDeduction (income : Nat) (elder : Bool) : Nat :=
  if income ≤ 9_000_000 then (if elder then 480_000 else 380_000)
  else if income ≤ 9_500_000 then (if elder then 320_000 else 260_000)
  else if income ≤ 10_000_000 then (if elder then 160_000 else 130_000)
  else 0

def longTermDeduction (premium : Nat) : Nat :=
  if premium ≤ 10_000 then premium
  else if premium ≤ 20_000 then 10_000 + (premium - 10_000) / 2
  else 15_000

example : spouseDeduction 9_000_000 false = 380_000 := by decide
example : spouseDeduction 9_000_000 true = 480_000 := by decide
example : spouseDeduction 9_600_000 false = 130_000 := by decide
example : longTermDeduction 10_000 = 10_000 := by decide
example : longTermDeduction 20_000 = 15_000 := by decide
example : longTermDeduction 30_000 = 15_000 := by decide

end JapanTaxLaw.ThresholdDeductions
