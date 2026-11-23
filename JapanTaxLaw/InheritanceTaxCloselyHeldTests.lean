import JapanTaxLaw.InheritanceTaxCloselyHeld
import JapanTaxLaw.InheritanceTaxCloselyHeldSpec

/-!
# InheritanceTaxCloselyHeldTests — 相続税法 第六十六条の二（実質的証明）
-/
namespace JapanTaxLaw.InheritanceTaxCloselyHeldTests
open JapanTaxLaw.InheritanceTaxCloselyHeld

theorem exceeds_spec (f t : Nat) : exceedsHalf f t = JapanTaxLaw.InheritanceTaxCloselyHeldSpec.exceedsHalfSpec f t := by
  unfold exceedsHalf JapanTaxLaw.InheritanceTaxCloselyHeldSpec.exceedsHalfSpec
  by_cases h : 2 * f > t <;> simp [h]
theorem domicile_spec (h : Bool) : deemedDomicile h = JapanTaxLaw.InheritanceTaxCloselyHeldSpec.deemedDomicileSpec h := by rfl
example (n : Nat) (h : n > 0) : exceedsHalf n n = true := all_family_exceeds n h
example (n : Nat) (h : n > 0) : exceedsHalf 0 n = false := no_family_not_exceeds n h
example (n : Nat) : exceedsHalf n (2 * n) = false := half_exactly_not_exceeds n
example (f t : Nat) (h : f <= t) (h2 : t < 2 * f) : exceedsHalf f t = true := majority_implies_exceeds f t h h2
example : deemedDomicile true = true := office_gives_domicile
example : deemedDomicile false = false := no_office_no_domicile
example : inheritanceTaxCloselyHeldDeclared = true := inheritance_tax_closely_held_is_declaration

end JapanTaxLaw.InheritanceTaxCloselyHeldTests
