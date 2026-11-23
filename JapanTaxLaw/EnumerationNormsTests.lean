import JapanTaxLaw.EnumerationNorms
import JapanTaxLaw.EnumerationNormsSpec

/-!
# EnumerationNormsTests — 選択的列挙演算子
-/
namespace JapanTaxLaw.EnumerationNormsTests

open JapanTaxLaw.EnumerationNorms

theorem spec_agreement (xs : List Bool) :
    anyOf xs = JapanTaxLaw.EnumerationNormsSpec.anyOfSpec xs := by
  induction xs with
  | nil => rfl
  | cons b rest ih =>
      have ih' : rest.or = JapanTaxLaw.EnumerationNormsSpec.anyOfSpec rest := by
        simpa [anyOf] using ih
      cases b <;> simp [anyOf, JapanTaxLaw.EnumerationNormsSpec.anyOfSpec, ih']

example : anyOf [] = false := anyOf_nil
example (xs : List Bool) : anyOf (true :: xs) = true := anyOf_true xs
example (xs : List Bool) : anyOf (false :: xs) = anyOf xs := anyOf_false xs
example (xs : List Bool) (h : allFalse xs) : anyOf xs = false := anyOf_all_false xs h
example (xs ys : List Bool) : anyOf (xs ++ ys) = (anyOf xs || anyOf ys) := anyOf_append xs ys
example : enumerationDeclared = true := enumeration_is_declaration

end JapanTaxLaw.EnumerationNormsTests
