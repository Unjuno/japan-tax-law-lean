import JapanTaxLaw.RegistrationCommercialTax

/-!
# RegistrationCommercialTax tests — 登録免許税法 別表第一（二）第二十四号（一）イ smoke checks

Decidable smoke tests for the stock-company formation registration tax model, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` covers
別表第一（二）第二十四号（一）イ boundaries: the ¥150,000-amount floor,
the ¥150,000 floor edges at capital near the threshold, zero-capital case,
and excluding formations (merger/subdivision).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- qualification gates
example : stockFormationTax ⟨true, true, 0⟩ = 150_000 := by decide
example : stockFormationTax ⟨true, false, 100_000_000⟩ = 0 := by decide
example : stockFormationTax ⟨false, true, 100_000_000⟩ = 0 := by decide

-- ¥0 capital: floor applies
example : stockFormationTax ⟨true, true, 1_000_000⟩ = 150_000 := by decide
example : stockFormationTax ⟨true, true, 10_000_000⟩ = 150_000 := by decide

-- Edge: computed < 150,000 → floor; computed == 150,000 → exactly 150,000; computed > 150,000 → computed
example : stockFormationTax ⟨true, true, 21_428_571⟩ = 150_000 := by decide
example : stockFormationTax ⟨true, true, 21_428_575⟩ = 150_000 := by decide
example : stockFormationTax ⟨true, true, 25_000_000⟩ = 175_000 := by decide
example : stockFormationTax ⟨true, true, 100_000_000⟩ = 700_000 := by decide
example : stockFormationTax ⟨true, true, 500_000_000⟩ = 3_500_000 := by decide

-- large numbers (capital at 10^9 = 7,000,000)
example : stockFormationTax ⟨true, true, 1_000_000_000⟩ = 7_000_000 := by decide

end JapanTaxLaw
