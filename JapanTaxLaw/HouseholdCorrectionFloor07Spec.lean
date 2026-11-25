import JapanTaxLaw.HouseholdCorrectionFloor07

/-
# HouseholdCorrectionFloor07 spec — 独立定式

The spec is written independently of the implementation, with a DIFFERENT
surface form for both comparisons:

  * belowFloor: impl `10*c < 7*p`  vs  spec `7*p > 10*c` (reverse orientation).
  * gapExceeds: impl `1000 < p - c` vs  spec `p > c + 1000` (addition, no
    subtraction). The equivalence of these two Nat forms is itself proved by
    `omega`; it is not assumed.

The only impl/spec bridge is the universal, kernel-checked theorem
`agreeCorrected`, which quantifies over EVERY Nat pair. No finite enumeration,
no `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.HouseholdCorrectionFloor07

/-- 独立定式: 「〇・七を乗じて得た数に満たず」を > で表す。 -/
@[reducible] def specBelow (corrected prev : Nat) : Prop :=
  7 * prev > 10 * corrected

/-- 独立定式: 「千を超える」を加法で表す（減法を使わない）。 -/
@[reducible] def specGap (corrected prev : Nat) : Prop :=
  prev > corrected + 1000

@[reducible] def specApplies (corrected prev : Nat) : Prop :=
  specBelow corrected prev ∧ specGap corrected prev

def specCorrected (corrected prev : Nat) : Nat :=
  if specApplies corrected prev then 7 * prev else 10 * corrected

theorem agreeCorrected (corrected prev : Nat) :
    specCorrected corrected prev = correctedScaled corrected prev := by
  unfold specCorrected correctedScaled specApplies specBelow specGap
  unfold correctionApplies belowFloor gapExceeds scaledFloor scaledCurrent
  unfold scale factor gapThreshold
  by_cases h1 : 7 * prev > 10 * corrected
  · have h1' : 10 * corrected < 7 * prev := by omega
    by_cases h2 : prev > corrected + 1000
    · have h2' : 1000 < prev - corrected := by omega
      simp [h1, h1', h2, h2']
    · have h2' : ¬ 1000 < prev - corrected := by omega
      simp [h1, h1', h2, h2']
  · have h1' : ¬ 10 * corrected < 7 * prev := by omega
    by_cases h2 : prev > corrected + 1000
    · have h2' : 1000 < prev - corrected := by omega
      simp [h1, h1', h2, h2']
    · have h2' : ¬ 1000 < prev - corrected := by omega
      simp [h1, h1', h2, h2']

/-- 普遍的な非自明性: 条件成立時は補正結果が現状値より真に大きい。 -/
theorem specCorrectionRaises (corrected prev : Nat) :
    specApplies corrected prev → 10 * corrected < specCorrected corrected prev := by
  unfold specApplies specBelow specGap specCorrected
  intro h
  rw [if_pos h]
  omega

end JapanTaxLaw.HouseholdCorrectionFloor07
