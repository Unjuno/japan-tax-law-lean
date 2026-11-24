import JapanTaxLaw.LiquorTaxSchedule12

/-! Independent spec for LiquorTaxSchedule12: base + increment × saturating excess. -/

namespace JapanTaxLaw.LiquorTaxSchedule12Spec

def specAmount (x : Nat) : Nat :=
  120000 + 10000 * (if x <= 12 then 0 else x - 12)

def agree (x : Nat) : Prop :=
  specAmount x = JapanTaxLaw.LiquorTaxSchedule12.amount x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specAmount JapanTaxLaw.LiquorTaxSchedule12.amount
  unfold JapanTaxLaw.LiquorTaxSchedule12.baseAmount JapanTaxLaw.LiquorTaxSchedule12.perUnit JapanTaxLaw.LiquorTaxSchedule12.threshold
  by_cases h : x <= 12
  · simp [h]
  · simp [h]

end JapanTaxLaw.LiquorTaxSchedule12Spec
