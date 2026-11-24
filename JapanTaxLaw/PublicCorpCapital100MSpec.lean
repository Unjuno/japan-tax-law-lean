import JapanTaxLaw.PublicCorpCapital100M

/-! Independent spec for PublicCorpCapital100M: strict `¬ x <= 100000000` form. -/

namespace JapanTaxLaw.PublicCorpCapital100MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 100000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.PublicCorpCapital100M.exceedsPublicCapital100M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.PublicCorpCapital100M.exceedsPublicCapital100M
  unfold JapanTaxLaw.PublicCorpCapital100M.publicCapitalFloor100M
  simp

end JapanTaxLaw.PublicCorpCapital100MSpec
