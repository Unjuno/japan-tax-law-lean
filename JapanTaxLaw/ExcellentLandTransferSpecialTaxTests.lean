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

end JapanTaxLaw
