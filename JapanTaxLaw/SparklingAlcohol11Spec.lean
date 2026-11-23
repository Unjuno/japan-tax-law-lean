import JapanTaxLaw.SparklingAlcohol11

/-! Independent spec for SparklingAlcohol11: strict `¬ 11 <= x` form. -/

namespace JapanTaxLaw.SparklingAlcohol11Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 11 <= x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.SparklingAlcohol11.isSparklingUnder11 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.SparklingAlcohol11.isSparklingUnder11
  unfold JapanTaxLaw.SparklingAlcohol11.alcoholLimit11
  simp

end JapanTaxLaw.SparklingAlcohol11Spec
