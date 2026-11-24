import JapanTaxLaw.RateCeilingTwoPercent

/-!
# Independent spec — art. 51 2% rate ceiling

The spec restates 「百分の二を超えない」 as the negation of the non-strict
cross-multiplied comparison, deliberately the opposite formulation from the
implementation's strict comparison. Agreement is universal over all Nat
numerator/denominator pairs.
-/
namespace JapanTaxLaw.RateCeilingTwoPercent

def specWithinCeiling (num den : Nat) : Bool :=
  decide (num * ceilingDen <= ceilingNum * den)

theorem agree_spec_impl (num den : Nat) :
    specWithinCeiling num den = (!exceedsCeiling num den) := by
  unfold specWithinCeiling exceedsCeiling
  by_cases h : ceilingNum * den < num * ceilingDen
  · have hn : ¬ num * ceilingDen <= ceilingNum * den := Nat.not_le.mpr h
    simp [h, hn]
  · have hle : num * ceilingDen <= ceilingNum * den := Nat.le_of_not_gt h
    simp [h, hle]

example : specWithinCeiling 2 100 = true := by decide
example : specWithinCeiling 3 100 = false := by decide

end JapanTaxLaw.RateCeilingTwoPercent
