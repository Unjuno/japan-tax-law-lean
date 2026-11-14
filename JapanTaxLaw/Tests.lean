import JapanTaxLaw.Residency

/-!
Truth-table tests of the *two Boolean-input abstraction*, not individual
taxpayer determinations. All four input combinations are checked by Lean.
-/

namespace JapanTaxLaw

-- Neither predicate holds.
example : resident ⟨false, false⟩ = false := by decide
example : nonResident ⟨false, false⟩ = true := by decide

-- Domestic domicile alone suffices.
example : resident ⟨true, false⟩ = true := by decide
example : nonResident ⟨true, false⟩ = false := by decide

-- One-year continuous domestic abode alone suffices.
example : resident ⟨false, true⟩ = true := by decide
example : nonResident ⟨false, true⟩ = false := by decide

-- Both predicates hold.
example : resident ⟨true, true⟩ = true := by decide
example : nonResident ⟨true, true⟩ = false := by decide

end JapanTaxLaw
