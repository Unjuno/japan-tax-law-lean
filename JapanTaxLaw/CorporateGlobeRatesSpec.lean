import JapanTaxLaw.CorporateGlobeRates

/-!
# CorporateGlobeRates spec — independent integer restatement of
   法人税法 art. 82の13 / art. 82の21 / art. 145の8 GloBE 関連税率計算

Source (pinned; identical to CorporateGlobeRates.lean):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012

Independent restatement of the three statutory rate formulas as plain Nat
arithmetic, **not** reusing the implementation's `TaxRate.applyFloor` helper:

  art. 82の13   — 課税標準国際最低課税残余額 × 907/1000 → (base * 907) / 1000
  art. 82の21   — 課税標準国内最低課税額 × 753/1000   → (base * 753) / 1000
  art. 145の8   — 外国法人 課税標準国内最低課税額 × 753/1000 → (base * 753) / 1000

The 課税標準額 is caller-established in both the implementation and this spec;
no eligibility Bool enters any formula. art. 82の21 and art. 145の8 share the
same 753/1000 arithmetic (the rate literals are identical); only the taxpayer
differs, and that distinction stays caller-established / doc-level.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec, art. 82の13: 課税標準国際最低課税残余額 × 907/1000 (百分の九十・七). -/
def specInternationalMinimumResidualTax (base : Money) : Money := (base * 907) / 1000

/-- Spec, art. 82の21: 課税標準国内最低課税額 × 753/1000 (百分の七十五・三). -/
def specDomesticMinimumTax (base : Money) : Money := (base * 753) / 1000

/-- Spec, art. 145の8: 外国法人 課税標準国内最低課税額 × 753/1000 (百分の七十五・三). -/
def specForeignDomesticMinimumTax (base : Money) : Money := (base * 753) / 1000

-- ==== points, all kernel-decided ====

example : specInternationalMinimumResidualTax 0 = 0 := by decide
example : specInternationalMinimumResidualTax 1 = 0 := by decide
example : specInternationalMinimumResidualTax 999 = 906 := by decide
example : specInternationalMinimumResidualTax 1000 = 907 := by decide
example : specInternationalMinimumResidualTax 100_000 = 90_700 := by decide
example : specInternationalMinimumResidualTax 1_000_000 = 907_000 := by decide

example : specDomesticMinimumTax 0 = 0 := by decide
example : specDomesticMinimumTax 1 = 0 := by decide
example : specDomesticMinimumTax 999 = 752 := by decide
example : specDomesticMinimumTax 1000 = 753 := by decide
example : specDomesticMinimumTax 100_000 = 75_300 := by decide
example : specDomesticMinimumTax 1_000_000 = 753_000 := by decide

example : specForeignDomesticMinimumTax 0 = 0 := by decide
example : specForeignDomesticMinimumTax 1 = 0 := by decide
example : specForeignDomesticMinimumTax 999 = 752 := by decide
example : specForeignDomesticMinimumTax 1000 = 753 := by decide
example : specForeignDomesticMinimumTax 100_000 = 75_300 := by decide
example : specForeignDomesticMinimumTax 1_000_000 = 753_000 := by decide

/-- Agreement of implementation with the independent integer formulas at a
    spread of caller-established bases (including floor-boundary points). -/
def agreeCorporateGlobeRates : Bool :=
  [0, 1, 99, 100, 101, 999, 1000, 12345, 100_000, 907_123].all fun n =>
    internationalMinimumResidualTax n == specInternationalMinimumResidualTax n &&
    domesticMinimumTax n == specDomesticMinimumTax n &&
    foreignDomesticMinimumTax n == specForeignDomesticMinimumTax n

example : agreeCorporateGlobeRates = true := by decide

end JapanTaxLaw
