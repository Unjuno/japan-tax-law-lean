import JapanTaxLaw.SakeTieredAmount

/-!
# Independent spec — art. 23(1)三 tiered amount

The spec avoids the `if` entirely: saturating `Nat` subtraction makes the
increment zero for degrees at or below 20. Agreement is proved for ALL degrees.
-/
namespace JapanTaxLaw.SakeTieredAmount

def specAmount (degree : Nat) : Nat :=
  baseYen + (degree - referenceDegree) * perDegreeYen

theorem agree_spec_impl (degree : Nat) : specAmount degree = tieredAmount degree := by
  unfold specAmount tieredAmount
  by_cases h : triggerDegree <= degree
  · simp [h]
  · have hd : degree <= referenceDegree := by
      by_cases hle : degree <= referenceDegree
      · exact hle
      · have hgt : referenceDegree < degree := Nat.lt_of_not_ge hle
        have h21 : triggerDegree <= degree := by
          simpa [triggerDegree, referenceDegree] using Nat.succ_le_of_lt hgt
        exact (h h21).elim
    simp [h, Nat.sub_eq_zero_of_le hd]

example : specAmount 20 = 200_000 := by decide
example : specAmount 21 = 210_000 := by decide

end JapanTaxLaw.SakeTieredAmount
