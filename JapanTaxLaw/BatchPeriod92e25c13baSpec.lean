import JapanTaxLaw.BatchPeriod92e25c13ba

/-! Independent restatement via the complementary comparison.
    Agreement is universal over all Nat elapsed counts. -/
namespace JapanTaxLaw.BatchPeriod92e25c13ba

def specMeets (x : Nat) : Bool := !decide (limit <= x)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : x < limit
  · have hn : ¬ limit <= x := Nat.not_le.mpr h
    simp [h, hn]
  · have hle : limit <= x := Nat.le_of_not_gt h
    simp [h, hle]

end JapanTaxLaw.BatchPeriod92e25c13ba
