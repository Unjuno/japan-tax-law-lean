import JapanTaxLaw.CollectionPeriodCap30

/-!
# CollectionPeriodCap30Spec — independent spec for 国税徴収法 art. 115

Independently transcribed 「三十日を超えることができない」 as the strict
`¬ 30 < days` formulation, rather than the implementation's `days <= 30`.
Agreement is checked in the Lean kernel.
-/

namespace JapanTaxLaw.CollectionPeriodCap30Spec

def specWithin (days : Nat) : Bool :=
  decide (¬ 30 < days)

def agreeWithin (d : Nat) : Prop :=
  specWithin d = JapanTaxLaw.CollectionPeriodCap30.withinPeriod d

theorem agree_within (d : Nat) : agreeWithin d := by
  unfold agreeWithin specWithin JapanTaxLaw.CollectionPeriodCap30.withinPeriod
  unfold JapanTaxLaw.CollectionPeriodCap30.maxPeriodDays
  simp

end JapanTaxLaw.CollectionPeriodCap30Spec
