import JapanTaxLaw.TaxAccountantExamFeeSchedule

/-! Independent spec for TaxAccountantExamFeeSchedule: one subject -> 4000 yen;
two or more subjects -> 4000 + 1500 x (subjects - 1). -/

namespace JapanTaxLaw.TaxAccountantExamFeeScheduleSpec

def secondSubjectFloor : Nat := 2

def specAmount (x : Nat) : Nat :=
  if x < secondSubjectFloor then 4000 else 4000 + 1500 * (x - 1)

def agree (x : Nat) : Prop :=
  specAmount x = JapanTaxLaw.TaxAccountantExamFeeSchedule.amount x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specAmount JapanTaxLaw.TaxAccountantExamFeeSchedule.amount
  unfold secondSubjectFloor
  unfold JapanTaxLaw.TaxAccountantExamFeeSchedule.baseAmount JapanTaxLaw.TaxAccountantExamFeeSchedule.perUnit JapanTaxLaw.TaxAccountantExamFeeSchedule.threshold
  by_cases h : x < 2
  · have h1 : x <= 1 := by omega
    simp [h, h1]
  · have h1 : ¬ x <= 1 := by omega
    simp [h, h1]

end JapanTaxLaw.TaxAccountantExamFeeScheduleSpec
