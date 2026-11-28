import JapanTaxLaw.InheritanceTaxArt1_3TenYearResidence

/-!
# InheritanceTaxArt1_3TenYearResidenceSpec — independent typed specification

Pinned source identical to the implementation module (相続税法 art.1の3).
The ten-year window is restated as a plain `Nat` literal read independently from
「十年以内」. The specification uses the complementary form (if the window is
strictly less than years-before, the answer is false) so it does not reuse the
implementation's `<=` predicate.
-/

namespace JapanTaxLaw.InheritanceTaxArt1_3TenYearResidence

/-- Independent restatement of 「十年」 (years). -/
def specWindow : Nat := 10

/-- Complementary formulation: not (10 < yearsBefore). -/
def specWithin (yearsBefore : Nat) : Bool :=
  if specWindow < yearsBefore then false else true

example : specWindow = 10 := by decide
example : specWithin 0 = true := by decide
example : specWithin 9 = true := by decide
example : specWithin 10 = true := by decide
example : specWithin 11 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeInheritanceTaxArt1_3TenYearResidence : Bool :=
  let years := [0, 1, 9, 10, 11, 19, 20]
  years.all fun y => hadResidenceWithin y == specWithin y

example : agreeInheritanceTaxArt1_3TenYearResidence = true := by decide

end JapanTaxLaw.InheritanceTaxArt1_3TenYearResidence
