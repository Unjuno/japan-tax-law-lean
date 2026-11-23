import JapanTaxLaw.CorpIncome10M

/-! Independent spec for CorpIncome10M: strict `¬ 10000000 < x` form. -/

namespace JapanTaxLaw.CorpIncome10MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 10000000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CorpIncome10M.withinCorpIncome10M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CorpIncome10M.withinCorpIncome10M
  unfold JapanTaxLaw.CorpIncome10M.corpIncomeCap10M
  simp

end JapanTaxLaw.CorpIncome10MSpec
