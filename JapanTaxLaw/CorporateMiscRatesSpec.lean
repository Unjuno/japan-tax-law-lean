import JapanTaxLaw.CorporateMiscRates

/-!
# CorporateMiscRates spec — independent integer restatement of
  法人税法 art. 87 / art. 82の5 / art. 145の12 税率計算

Source (pinned; identical to CorporateMiscRates.lean):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012

Independent restatement of the three statutory rate formulas as plain Nat
arithmetic, **not** reusing the implementation's `TaxRate.applyFloor` helper:

  art. 87        — 退職年金等積立金 × 1/100      → (reserve * 1) / 100
  art. 82の5     — 課税標準国際最低課税額 × 907/1000 → (base * 907) / 1000
  art. 145の12   — 外国法人退職年金積立金 × 1/100 → (reserve * 1) / 100

The 課税標準額 is caller-established in both the implementation and this spec;
no eligibility Bool enters any formula. art. 87 and art. 145の12 share the same
1/100 arithmetic (the statute texts are identical); only the taxpayer differs,
and that distinction stays caller-established / doc-level.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec, art. 87: 退職年金等積立金 × 1/100. -/
def specRetirementPensionReserveTax (reserve : Money) : Money := (reserve * 1) / 100

/-- Spec, art. 82の5: 課税標準国際最低課税額 × 907/1000 (百分の九十・七). -/
def specInternationalMinimumTax (base : Money) : Money := (base * 907) / 1000

/-- Spec, art. 145の12: 外国法人退職年金積立金 × 1/100. -/
def specForeignPensionReserveTax (reserve : Money) : Money := (reserve * 1) / 100

-- ==== points, all kernel-decided ====

example : specRetirementPensionReserveTax 0 = 0 := by decide
example : specRetirementPensionReserveTax 100 = 1 := by decide
example : specRetirementPensionReserveTax 12345 = 123 := by decide

example : specInternationalMinimumTax 0 = 0 := by decide
example : specInternationalMinimumTax 1 = 0 := by decide
example : specInternationalMinimumTax 1000 = 907 := by decide
example : specInternationalMinimumTax 100_000 = 90_700 := by decide

example : specForeignPensionReserveTax 0 = 0 := by decide
example : specForeignPensionReserveTax 100 = 1 := by decide
example : specForeignPensionReserveTax 12345 = 123 := by decide

/-- Agreement of implementation with the independent integer formulas at a
    spread of caller-established bases (including floor-boundary points). -/
def agreeCorporateMiscRates : Bool :=
  [0, 1, 99, 100, 101, 999, 1000, 12345, 100_000, 907_123].all fun n =>
    retirementPensionReserveTax n == specRetirementPensionReserveTax n &&
    internationalMinimumTax n == specInternationalMinimumTax n &&
    foreignPensionReserveTax n == specForeignPensionReserveTax n

example : agreeCorporateMiscRates = true := by decide

end JapanTaxLaw
