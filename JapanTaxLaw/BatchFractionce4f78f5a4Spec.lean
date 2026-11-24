import JapanTaxLaw.BatchFractionce4f78f5a4

/-! Independent restatement: negation of the complementary comparison.
    Agreement is universal over all Nat numerator/denominator pairs. -/
namespace JapanTaxLaw.BatchFractionce4f78f5a4

def specMeets (n d : Nat) : Bool := !decide (num * d < den * n)

theorem agree_spec_impl (n d : Nat) : specMeets n d = meets n d := by
  unfold specMeets meets
  by_cases h : den * n <= num * d
  · have hn : ¬ num * d < den * n := Nat.not_lt.mpr h
    simp [h, hn]
  · have hle : num * d < den * n := Nat.lt_of_not_ge h
    simp [h, hle]

end JapanTaxLaw.BatchFractionce4f78f5a4
