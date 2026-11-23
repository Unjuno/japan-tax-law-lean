import JapanTaxLaw.CategoryDispatchNorms
import JapanTaxLaw.CategoryDispatchNormsSpec

/-!
# CategoryDispatchNormsTests — 区分別選択演算子
-/
namespace JapanTaxLaw.CategoryDispatchNormsTests

open JapanTaxLaw.CategoryDispatchNorms

theorem spec_agreement (k : Nat) (table : List (Nat × Nat)) :
    dispatch k table = JapanTaxLaw.CategoryDispatchNormsSpec.dispatchSpec k table := by
  induction table with
  | nil => rfl
  | cons p rest ih =>
      rcases p with ⟨pk, pv⟩
      by_cases h : pk == k
      · simp [dispatch, JapanTaxLaw.CategoryDispatchNormsSpec.dispatchSpec, h]
      · simp [dispatch, JapanTaxLaw.CategoryDispatchNormsSpec.dispatchSpec, h, ih]

example (k : Nat) : dispatch k [] = none := dispatch_empty k
example (k v : Nat) (r : List (Nat × Nat)) : dispatch k ((k, v) :: r) = some v := dispatch_hit k v r
example (k j v : Nat) (r : List (Nat × Nat)) (h : j ≠ k) : dispatch k ((j, v) :: r) = dispatch k r := dispatch_miss k j v r h
example (k v1 v2 : Nat) (r : List (Nat × Nat)) : dispatch k ((k, v1) :: (k, v2) :: r) = some v1 := dispatch_first_wins k v1 v2 r
example : dispatchDeclared = true := dispatch_is_declaration

end JapanTaxLaw.CategoryDispatchNormsTests
