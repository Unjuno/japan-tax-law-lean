import JapanTaxLaw.TouristTaxTaxablePassengers

/-
# TouristTaxTaxablePassengersSpec — 独立定式

The spec does NOT reuse the implementation's grouped subtraction. It applies
the three deductions one at a time (`i - ro - ha - ni`), a different surface
form whose equality with `i - (ro + ha + ni)` must be proved, not assumed.

The only bridge is the universal, kernel-checked theorem
`agreeTaxablePassengers`, quantifying over EVERY Nat quadruple.
No `sorry`, `admit`, `axiom`, `by_cases` or `Classical.choice`.
-/

namespace JapanTaxLaw.TouristTaxTaxablePassengers

/-- 独立定式: 控除を三段階に分けて適用する。 -/
def specTaxablePassengers (i ro ha ni : Nat) : Nat :=
  i - ro - ha - ni

theorem agreeTaxablePassengers (i ro ha ni : Nat) :
    specTaxablePassengers i ro ha ni = taxablePassengers i ro ha ni := by
  unfold specTaxablePassengers taxablePassengers
  omega

/-- 独立仕様側の普遍的境界: 三段階控除は途中で零に張り付く。 -/
theorem specNeverExceedsTotal (i ro ha ni : Nat) :
    specTaxablePassengers i ro ha ni <= i := by
  unfold specTaxablePassengers
  omega

end JapanTaxLaw.TouristTaxTaxablePassengers
