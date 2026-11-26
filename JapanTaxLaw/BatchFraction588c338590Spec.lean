import JapanTaxLaw.BatchFraction588c338590

/-! Independent restatement: negation of the complementary comparison.
    Agreement is universal over all Nat numerator/denominator pairs. -/
namespace JapanTaxLaw.BatchFraction588c338590

def specMeets (n d : Nat) : Bool := !decide (den * n < num * d)

theorem agree_spec_impl (n d : Nat) : specMeets n d = meets n d := by
  unfold specMeets meets
  by_cases h : num * d <= den * n
  · have hn : ¬ den * n < num * d := Nat.not_lt.mpr h
    simp [h, hn]
  · have hle : den * n < num * d := Nat.lt_of_not_ge h
    simp [h, hle]

end JapanTaxLaw.BatchFraction588c338590
