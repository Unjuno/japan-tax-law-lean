import JapanTaxLaw.CustomsDutiableValueThreshold

/-!
# CustomsDutiableValueThresholdSpec — independent spec for 関税定率法施行令 第一条の二(1)第三号

Law id: 329CO0000000155 (関税定率法施行令, Cabinet Order)
Revision: 329CO0000000155_20260401_508CO0000000085
Article: 第一条の二(1)第三号 — 課税価格が十万円を超えるもの
Normative unit: NORM|347d0d0ebd32cab1a2f5054abe7a87ebe56cae34b125a2481f38c63e5cf05723

The implementation uses `thresholdYen < x`. The independent spec reformulates
the strict lower bound as a successor-based non-strict bound:
`Nat.succ thresholdYen ≤ x` (equivalent via `Nat.succ_le_iff`, but a distinct
formulation). The kernel proves equivalence for ALL dutiable values.

Boundary theorems: 100,000 fails (超え = strict); 100,001 qualifies.

Not modelled: the first two items of 第一条の二(1), the substantive rule this
item gates, other paragraphs, 省令 details, customs valuation rules.
-/

namespace JapanTaxLaw.CustomsDutiableValueThreshold

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-based strict lower bound (succ 100000 ≤ x). -/
def specAboveThreshold (dutiableValue : Money) : Prop :=
  Nat.succ thresholdYen ≤ dutiableValue

/-- Correspondence for all dutiable values. Universal, kernel-checked. -/
theorem agree_threshold (dutiableValue : Money) :
    aboveThreshold dutiableValue ↔ specAboveThreshold dutiableValue := by
  unfold aboveThreshold specAboveThreshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

/-- 十万円 (100,000) itself does NOT qualify (超え is strict). -/
theorem threshold_exclusive : ¬ aboveThreshold 100_000 := by
  unfold aboveThreshold thresholdYen
  decide

/-- 100,001 is the first qualifying dutiable value. -/
theorem first_above : aboveThreshold 100_001 := by
  unfold aboveThreshold thresholdYen
  decide

/-- Threshold decoded correctly: 十万円 = 100,000. -/
theorem threshold_decoded : thresholdYen = 100_000 := rfl

end JapanTaxLaw.CustomsDutiableValueThreshold
