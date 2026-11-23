import JapanTaxLaw.MinMaxSelectionNorms
import JapanTaxLaw.MinMaxSelectionNormsSpec

/-!
# MinMaxSelectionNormsTests — 最小/最大選択演算子
-/
namespace JapanTaxLaw.MinMaxSelectionNormsTests
open JapanTaxLaw.MinMaxSelectionNorms

theorem min_spec (a b : Nat) : selectMin a b = JapanTaxLaw.MinMaxSelectionNormsSpec.selectMinSpec a b := by rfl
theorem max_spec (a b : Nat) : selectMax a b = JapanTaxLaw.MinMaxSelectionNormsSpec.selectMaxSpec a b := by rfl
example (a b : Nat) : selectMin a b <= a := selected_min_le_left a b
example (a b : Nat) : selectMin a b <= b := selected_min_le_right a b
example (a b : Nat) (h : a <= b) : selectMin a b = a := selected_min_eq_left a b h
example (a b : Nat) : a <= selectMax a b := le_selected_max_left a b
example (a b : Nat) : b <= selectMax a b := le_selected_max_right a b
example (a b : Nat) (h : b <= a) : selectMax a b = a := selected_max_eq_left a b h
example (a b : Nat) : selectMin a b <= selectMax a b := selected_min_le_max a b
example : minMaxSelectionDeclared = true := min_max_selection_is_declaration

end JapanTaxLaw.MinMaxSelectionNormsTests
