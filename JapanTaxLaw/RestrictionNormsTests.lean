import JapanTaxLaw.RestrictionNorms
import JapanTaxLaw.RestrictionNormsSpec

/-!
# RestrictionNormsTests — 限定演算子
-/
namespace JapanTaxLaw.RestrictionNormsTests

open JapanTaxLaw.RestrictionNorms

theorem spec_agreement (c a : Nat) :
    restrictTo c a = JapanTaxLaw.RestrictionNormsSpec.restrictSpec c a := by
  unfold restrictTo JapanTaxLaw.RestrictionNormsSpec.restrictSpec
  by_cases h : c = a
  · simp [h]
  · have hn : c != a := by simp [h]
    simp [h, hn]
example (x : Nat) : restrictTo x x = true := restrict_hit x
example (x y : Nat) (h : x ≠ y) : restrictTo x y = false := restrict_miss x y h
example (x : Nat) : restrictTo x 0 = (x == 0) := restrict_zero x
example : restrictionDeclared = true := restriction_is_declaration

end JapanTaxLaw.RestrictionNormsTests
