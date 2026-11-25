import JapanTaxLaw.BatchFractionca79f76a41

/-! Independent restatement: negation of the complementary comparison.
    Agreement is universal over all Nat numerator/denominator pairs. -/
namespace JapanTaxLaw.BatchFractionca79f76a41

def specMeets (n d : Nat) : Bool := !decide (den * n <= num * d)

theorem agree_spec_impl (n d : Nat) : specMeets n d = meets n d := by
  unfold specMeets meets
  by_cases h : num * d < den * n
  · have hn : ¬ den * n <= num * d := Nat.not_le.mpr h
    simp [h, hn]
  · have hle : den * n <= num * d := Nat.le_of_not_gt h
    simp [h, hle]

end JapanTaxLaw.BatchFractionca79f76a41
