import JapanTaxLaw.TotalAmountNorms
import JapanTaxLaw.TotalAmountNormsSpec

/-!
# TotalAmountNormsTests — 合計額（総和）
-/
namespace JapanTaxLaw.TotalAmountNormsTests

open JapanTaxLaw.TotalAmountNorms

theorem total_spec (values : List Nat) :
    totalAmount values = JapanTaxLaw.TotalAmountNormsSpec.totalSpec values := by
  induction values with
  | nil => rfl
  | cons a xs ih =>
      dsimp [totalAmount] at ih ⊢
      simp [JapanTaxLaw.TotalAmountNormsSpec.totalSpec, ih]

example : totalAmount [] = 0 := total_nil
example (a : Nat) : totalAmount [a] = a := total_singleton a
example (a : Nat) (xs : List Nat) : totalAmount (a :: xs) = a + totalAmount xs := total_cons a xs
example (xs ys : List Nat) : totalAmount (xs ++ ys) = totalAmount xs + totalAmount ys := total_append xs ys
example (a : Nat) (xs : List Nat) : a <= totalAmount (a :: xs) := total_ge_each a xs
example : totalDeclared = true := total_is_declaration

end JapanTaxLaw.TotalAmountNormsTests
