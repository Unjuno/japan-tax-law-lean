import JapanTaxLaw.DateSelectionNorms
import JapanTaxLaw.DateSelectionNormsSpec

/-!
# DateSelectionNormsTests — 日付選択演算子
-/
namespace JapanTaxLaw.DateSelectionNormsTests

open JapanTaxLaw.DateSelectionNorms

theorem min_spec (a b : Nat) :
    earlier a b = JapanTaxLaw.DateSelectionNormsSpec.minSpec a b := by
  rw [JapanTaxLaw.DateSelectionNormsSpec.minSpec_eq]
  rfl
theorem max_spec (a b : Nat) :
    later a b = JapanTaxLaw.DateSelectionNormsSpec.maxSpec a b := by
  rw [JapanTaxLaw.DateSelectionNormsSpec.maxSpec_eq]
  rfl
example (a b : Nat) : earlier a b <= a := earlier_le_left a b
example (a b : Nat) : earlier a b <= b := earlier_le_right a b
example (a b : Nat) : a <= later a b := left_le_later a b
example (a b : Nat) : b <= later a b := right_le_later a b
example (a b : Nat) : earlier a b = earlier b a := earlier_comm a b
example (a b : Nat) : later a b = later b a := later_comm a b
example (a : Nat) : earlier a a = a := earlier_self a
example (a : Nat) : later a a = a := later_self a
example : dateSelectionDeclared = true := date_selection_is_declaration

end JapanTaxLaw.DateSelectionNormsTests
