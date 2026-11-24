import JapanTaxLaw.BatchThresholdGTf6e5b96591

/-! Independent restatement of the threshold by the opposite comparison.
    Agreement holds for every Nat amount (universal, not a finite grid). -/
namespace JapanTaxLaw.BatchThresholdGTf6e5b96591

def specMeets (x : Nat) : Bool := !decide (x <= limit)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : limit < x
  · have hn : ¬ x <= limit := Nat.not_le.mpr h
    simp [h, hn]
  · have hle : x <= limit := Nat.le_of_not_gt h
    simp [h, hle]

end JapanTaxLaw.BatchThresholdGTf6e5b96591
