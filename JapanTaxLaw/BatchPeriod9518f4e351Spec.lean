import JapanTaxLaw.BatchPeriod9518f4e351

/-! Independent restatement via the complementary comparison.
    Agreement is universal over all Nat elapsed counts. -/
namespace JapanTaxLaw.BatchPeriod9518f4e351

def specMeets (x : Nat) : Bool := !decide (x <= limit)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : limit < x
  · have hn : ¬ x <= limit := Nat.not_le.mpr h
    simp [h, hn]
  · have hle : x <= limit := Nat.le_of_not_gt h
    simp [h, hle]

end JapanTaxLaw.BatchPeriod9518f4e351
