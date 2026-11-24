import JapanTaxLaw.ForeignCorpDeduction10M

/-! Independent spec for ForeignCorpDeduction10M: strict `¬ 10000000 < x` form. -/

namespace JapanTaxLaw.ForeignCorpDeduction10MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 10000000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ForeignCorpDeduction10M.withinForeignDeduction10M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ForeignCorpDeduction10M.withinForeignDeduction10M
  unfold JapanTaxLaw.ForeignCorpDeduction10M.foreignDeductionCap10M
  simp

end JapanTaxLaw.ForeignCorpDeduction10MSpec
