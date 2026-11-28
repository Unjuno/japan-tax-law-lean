import JapanTaxLaw.InheritanceTaxArt37ReadingOneYear

/-!
# InheritanceTaxArt37ReadingOneYearSpec — independent typed specification

Pinned source identical to the implementation module (相続税法 art.37(6)).
The two periods are restated as plain `Nat` literals read independently from
「二年」 and 「一年」. The specification derives the effective month limit by
multiplying the replacement years by months-per-year, and checks the period by
complementary strict-excess form, so it does not reuse the implementation's
`<=` predicate.
-/

namespace JapanTaxLaw.InheritanceTaxArt37ReadingOneYear

/-- Independent restatement of 「二年」 (years). -/
def specOriginal : Nat := 2
/-- Independent restatement of 「一年」 (years). -/
def specReplacement : Nat := 1
/-- Independent derived limit: replacement years × 12 months. -/
def specLimit : Nat := specReplacement * 12

/-- Complementary formulation: not (limit < months). -/
def specWithin (months : Nat) : Bool :=
  if specLimit < months then false else true

example : specOriginal = 2 := by decide
example : specReplacement = 1 := by decide
example : specLimit = 12 := by decide
example : specWithin 0 = true := by decide
example : specWithin 11 = true := by decide
example : specWithin 12 = true := by decide
example : specWithin 13 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeInheritanceTaxArt37ReadingOneYear : Bool :=
  let months := [0, 1, 11, 12, 13, 23, 24, 25]
  months.all fun m => withinOneYear m == specWithin m

example : agreeInheritanceTaxArt37ReadingOneYear = true := by decide

end JapanTaxLaw.InheritanceTaxArt37ReadingOneYear
