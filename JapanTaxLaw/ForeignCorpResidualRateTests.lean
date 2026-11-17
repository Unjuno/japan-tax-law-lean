import JapanTaxLaw.ForeignCorpResidualRate

/-!
# ForeignCorpResidualRate tests — 法人税法 art. 145の4 smoke checks

Decidable kernel smoke tests, pinned to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準額 is caller-established; no Bool enters any formula.
Rounding is floor (切り捨て) via TaxRate.applyFloor.
This module re-checks the rate literal and several base amounts independently
of the main module's own smoke examples.
-/

namespace JapanTaxLaw.ForeignCorpResidualRate

open JapanTaxLaw.TaxFinance

-- rate literal: 百分の九十・七 = 907/1000
example : foreignCorpResidualRate.num = 907 := by decide
example : foreignCorpResidualRate.den = 1000 := by decide
example : 0 < foreignCorpResidualRate.den := by decide

-- art. 145の4: 課税標準国際最低課税残余額 × 907/1000 (floor), 複数額
example : foreignCorpResidualTax 0 = 0 := by decide
example : foreignCorpResidualTax 1 = 0 := by decide
example : foreignCorpResidualTax 2 = 1 := by decide
example : foreignCorpResidualTax 99 = 89 := by decide
example : foreignCorpResidualTax 100 = 90 := by decide
example : foreignCorpResidualTax 999 = 906 := by decide
example : foreignCorpResidualTax 1000 = 907 := by decide
example : foreignCorpResidualTax 1001 = 907 := by decide
example : foreignCorpResidualTax 12345 = 11196 := by decide
example : foreignCorpResidualTax 100_000 = 90_700 := by decide
example : foreignCorpResidualTax 1_000_000 = 907_000 := by decide

end JapanTaxLaw.ForeignCorpResidualRate
