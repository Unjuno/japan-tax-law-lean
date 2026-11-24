import JapanTaxLaw.BatchThresholdLEadf0669a1d

/-! Independent restatement of the threshold by the opposite comparison.
    Agreement holds for every Nat amount (universal, not a finite grid). -/
namespace JapanTaxLaw.BatchThresholdLEadf0669a1d

def specMeets (x : Nat) : Bool := !decide (limit < x)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : x <= limit
  · have hn : ¬ limit < x := Nat.not_lt.mpr h
    simp [h, hn]
  · have hle : limit < x := Nat.lt_of_not_ge h
    simp [h, hle]

end JapanTaxLaw.BatchThresholdLEadf0669a1d
