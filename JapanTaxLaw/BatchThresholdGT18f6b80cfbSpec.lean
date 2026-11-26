import JapanTaxLaw.BatchThresholdGT18f6b80cfb

/-! Independent restatement of the threshold by the opposite comparison.
    Agreement holds for every Nat amount (universal, not a finite grid). -/
namespace JapanTaxLaw.BatchThresholdGT18f6b80cfb

def specMeets (x : Nat) : Bool := !decide (x <= limit)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : limit < x
  · have hn : ¬ x <= limit := Nat.not_le.mpr h
    simp [h, hn]
  · have hle : x <= limit := Nat.le_of_not_gt h
    simp [h, hle]

end JapanTaxLaw.BatchThresholdGT18f6b80cfb
