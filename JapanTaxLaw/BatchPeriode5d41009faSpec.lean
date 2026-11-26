import JapanTaxLaw.BatchPeriode5d41009fa

/-! Independent restatement via the complementary comparison.
    Agreement is universal over all Nat elapsed counts. -/
namespace JapanTaxLaw.BatchPeriode5d41009fa

def specMeets (x : Nat) : Bool := !decide (limit < x)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : x <= limit
  · have hn : ¬ limit < x := Nat.not_lt.mpr h
    simp [h, hn]
  · have hle : limit < x := Nat.lt_of_not_ge h
    simp [h, hle]

end JapanTaxLaw.BatchPeriode5d41009fa
