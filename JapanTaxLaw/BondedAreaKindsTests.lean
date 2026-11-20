import JapanTaxLaw.BondedAreaKindsSpec

/-!
# BondedAreaKindsTests — kernel-checked checks for 関税法 art.29（五種）

All checks are `rfl` / `by simp` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.BondedAreaKinds

open BondedAreaKind

example : kindCount = 5 := rfl
example : allKinds.length = 5 := rfl
example : allKinds.Nodup := by simp [allKinds]
example : designatedBondedArea ∈ allKinds := by simp [allKinds]
example : bondedWarehouse ∈ allKinds := by simp [allKinds]
example : bondedFactory ∈ allKinds := by simp [allKinds]
example : bondedExhibition ∈ allKinds := by simp [allKinds]
example : comprehensiveBondedArea ∈ allKinds := by simp [allKinds]
example : kindCount = specKindCount := agree_kind_count
example : allKinds.Nodup := all_kinds_nodup
example : comprehensiveBondedArea ∈ allKinds := all_kinds_exhaustive comprehensiveBondedArea
example : kindCount = 5 := kind_count_is_five

end JapanTaxLaw.BondedAreaKinds
