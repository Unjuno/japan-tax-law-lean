import JapanTaxLaw.CorporateTaxRate

/-!
# CorporateTaxRate tests — 法人税法 art. 66 smoke checks

Decidable smoke tests for the corporate income tax rate model (art. 66), pinned
to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01

Each `example` covers an art. 66 boundary: ordinary corporation under art. 66(1),
SME-relief boundary at art. 66(2) (資本金1億円以下 etc. with ¥8,000,000 cap),
exclusions at art. 66(5), and the flat 19% of art. 66(3).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 0 is always 0
example : corporateTax .ordinary ⟨100_000_000, false, false, false, false, false, false⟩
    0 = 0 := by decide

-- SME at the cap: straight 8,000,000 * 19% = 1,520,000
example : corporateTax .ordinary ⟨100_000_000, false, false, false, false, false, false⟩
    8_000_000 = 1_520_000 := by decide

-- just below cap
example : corporateTax .ordinary ⟨100_000_000, false, false, false, false, false, false⟩
    7_500_000 = 1_425_000 := by decide

-- into the ordinary band above the cap
example : corporateTax .ordinary ⟨100_000_000, false, false, false, false, false, false⟩
    10_000_000 = 1_984_000 := by decide

-- just over 8,000,000: 1,520,000 + 232 of the extra 0 → at 8,000,001
example : corporateTax .ordinary ⟨100_000_000, false, false, false, false, false, false⟩
    8_000_001 = 1_520_000 := by decide

-- No capital: still qualifies
example : corporateTax .ordinary ⟨0, true, false, false, false, false, false⟩
    8_000_000 = 1_520_000 := by decide

-- Large capital: straight ordinary rate 23.2%
example : corporateTax .ordinary ⟨500_000_000, false, false, false, false, false, false⟩
    8_000_000 = 1_856_000 := by decide

-- Excluded by a large-corp complete-control relation
example : corporateTax .ordinary ⟨1, false, false, true, false, false, false⟩
    8_000_000 = 1_856_000 := by decide

-- Excluded by being an investment corporation
example : corporateTax .ordinary ⟨1, false, false, false, true, false, false⟩
    8_000_000 = 1_856_000 := by decide

-- Excluded by being an SEC (特定目的会社)
example : corporateTax .ordinary ⟨1, false, false, false, false, true, false⟩
    8_000_000 = 1_856_000 := by decide

-- Public interest / cooperative: flat 19% regardless of size or category
example : corporateTax .publicInterestOrCoop ⟨500_000_000, true, false, false, false, false, false⟩
    5_000_000 = 950_000 := by decide
example : corporateTax .publicInterestOrCoop ⟨0, true, false, false, false, false, false⟩
    5_000_000 = 950_000 := by decide
example : corporateTax .publicInterestOrCoop ⟨1, false, false, true, false, false, false⟩
    5_000_000 = 950_000 := by decide

end JapanTaxLaw
