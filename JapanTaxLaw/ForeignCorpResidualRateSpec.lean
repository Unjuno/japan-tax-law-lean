import JapanTaxLaw.ForeignCorpResidualRate

/-!
# ForeignCorpResidualRate spec — 法人税法 art. 145の4 の独立整数定式

Source (pinned; identical to ForeignCorpResidualRate.lean):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012

Independent restatement of the statutory rate formula as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  art. 145の4 — 外国法人 課税標準国際最低課税残余額 × 907/1000
                → (base * 907) / 1000  （百分の九十・七 = 90.7%）

The 課税標準額 is caller-established in both the implementation and this spec;
no eligibility Bool enters any formula. Rounding is floor (切り捨て).

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw.ForeignCorpResidualRate

open JapanTaxLaw.TaxFinance

/-- Spec, art. 145の4: 外国法人 課税標準国際最低課税残余額 × 907/1000
    （百分の九十・七, floor）。独立整数定式。 -/
def specForeignCorpResidualTax (base : Money) : Money := (base * 907) / 1000

-- ==== points, all kernel-decided ====

example : specForeignCorpResidualTax 0 = 0 := by decide
example : specForeignCorpResidualTax 1 = 0 := by decide
example : specForeignCorpResidualTax 999 = 906 := by decide
example : specForeignCorpResidualTax 1000 = 907 := by decide
example : specForeignCorpResidualTax 100_000 = 90_700 := by decide
example : specForeignCorpResidualTax 1_000_000 = 907_000 := by decide

/-- Agreement of the implementation with the independent integer formula at a
    spread of caller-established bases (including floor-boundary points). -/
def agreeForeignCorpResidualRate : Bool :=
  [0, 1, 99, 100, 101, 999, 1000, 12345, 100_000, 907_123].all fun n =>
    foreignCorpResidualTax n == specForeignCorpResidualTax n

example : agreeForeignCorpResidualRate = true := by decide

end JapanTaxLaw.ForeignCorpResidualRate
