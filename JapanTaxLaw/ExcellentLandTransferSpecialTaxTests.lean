import JapanTaxLaw.ExcellentLandTransferSpecialTax
import JapanTaxLaw.ExcellentLandTransferSpecialTaxSpec

/-!
# Boundary tests — 租税特別措置法 art. 31の2

All examples are kernel-decided; no `sorry`, `admit` or axioms.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

example : excellentLandBoundary = 20_000_000 := rfl
example : excellentLandLowRate = ⟨10, 100, by decide⟩ := rfl
example : excellentLandExcessRate = ⟨15, 100, by decide⟩ := rfl

example : excellentLandGainTax ⟨true, true, true, true⟩ 19_999_999 = 1_999_999 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 20_000_000 = 2_000_000 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 20_000_001 = 2_000_000 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 20_000_006 = 2_000_000 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 20_000_007 = 2_000_001 := by decide

example : excellentLandGainTax ⟨true, true, true, true⟩ 1 ≤
    excellentLandGainTax ⟨true, true, true, true⟩ 2 :=
  excellentLandGainTax_mono ⟨true, true, true, true⟩ (by decide) (by decide)

example : excellentLandGainTax ⟨true, true, true, true⟩ 0 = 0 :=
  excellentLandGainTax_zero ⟨true, true, true, true⟩ (by decide)

-- ==== required boundary coverage (kernel-decided; values recomputed from art. 31の2(1)) ====
-- (a) zero input: 0 → 10% of 0 = 0
example : excellentLandGainTax ⟨true, true, true, true⟩ 0 = 0 := by decide
-- (b) small positive inputs 1..13: floor(gain × 10 / 100)
--     1, 9 → 0 (below ¥10); 10, 13 → 1
example : excellentLandGainTax ⟨true, true, true, true⟩ 1 = 0 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 9 = 0 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 10 = 1 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 13 = 1 := by decide
-- (c) saturation/identity: floor rounding sends sub-¥10 taxable gains to ¥0
--     (result equals 0 — a genuine saturating floor boundary)
example : excellentLandGainTax ⟨true, true, true, true⟩ 5 = 0 := by decide

end JapanTaxLaw
