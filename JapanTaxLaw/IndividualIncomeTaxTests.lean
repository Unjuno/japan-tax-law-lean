import JapanTaxLaw.IndividualIncomeTax

/-!
# IndividualIncomeTax tests — 所得税法 art. 89 smoke checks

Decidable smoke tests for the art. 89(1) progressive table model, from the
pinned revision (see `IndividualIncomeTax.lean` for the pin):
  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

These call the model with concrete yen inputs and `decide` the expected
amounts (computed from the statutory table: rate × exact portion of band,
sum). Boundary and interior points per band, plus the thousand/hundred-yen
floor lemmas.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- statutoryTax: zero and first-band boundary points
example : statutoryTax 0 = 0 := by decide
example : statutoryTax 1_950_000 = 97_500 := by decide
example : statutoryTax 2_000_000 = 102_500 := by decide
example : statutoryTax 3_300_000 = 232_500 := by decide
example : statutoryTax 4_950_000 = 562_500 := by decide
example : statutoryTax 5_000_000 = 572_500 := by decide
example : statutoryTax 6_950_000 = 962_500 := by decide
example : statutoryTax 9_000_000 = 1_434_000 := by decide
example : statutoryTax 10_000_000 = 1_764_000 := by decide
example : statutoryTax 18_000_000 = 4_404_000 := by decide
example : statutoryTax 20_000_000 = 5_204_000 := by decide
example : statutoryTax 40_000_000 = 13_204_000 := by decide
example : statutoryTax 50_000_000 = 17_704_000 := by decide

-- Woodland rule: one fifth then ×5
example : woodlandTax 0 = 0 := by decide
example : woodlandTax 10_000_000 = statutoryTax 2_000_000 * 5 := by decide
example : woodlandTax 20_000_000 = statutoryTax 4_000_000 * 5 := by decide
example : woodlandTax 90_000_000 = statutoryTax 18_000_000 * 5 := by decide

-- Combined resident computation: general + retirement + woodland
example : residentTax 0 0 0 = 0 := by decide
example : residentTax 10_000_000 0 0 = 1_764_000 := by decide
example : residentTax 0 10_000_000 0 = 1_764_000 := by decide
example : residentTax 0 0 20_000_000 = statutoryTax 4_000_000 * 5 := by decide

-- thousandYenFloor (国税通則法 art. 118(1)): 1,999,999 → 1,999,000
example : thousandYenFloor 1_999_999 = 1_999_000 := by decide
example : thousandYenFloor 1_000 = 1_000 := by decide
example : thousandYenFloor 999 = 0 := by decide

-- hundredYenFloor (国税通則法 art. 119(1)): 1,234,567 → 1,234,500
example : hundredYenFloor 1_234_567 = 1_234_500 := by decide
example : hundredYenFloor 100 = 100 := by decide
example : hundredYenFloor 99 = 0 := by decide

-- Idempotence boundary checks (already proved, test at concrete points)
example : thousandYenFloor (thousandYenFloor 1_234_999) = thousandYenFloor 1_234_999 := by decide
example : hundredYenFloor (hundredYenFloor 1_234_999) = hundredYenFloor 1_234_999 := by decide

end JapanTaxLaw
