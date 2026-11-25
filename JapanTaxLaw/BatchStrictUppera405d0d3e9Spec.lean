import JapanTaxLaw.BatchStrictUppera405d0d3e9

/-! Independent restatement: negation of the non-strict comparison.
    Agreement is universal over all Nat amounts. -/
namespace JapanTaxLaw.BatchStrictUppera405d0d3e9

def specMeets (x : Nat) : Bool := !decide (upperYen <= x)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : x < upperYen
  · have hn : ¬ upperYen <= x := Nat.not_le.mpr h
    simp [h, hn]
  · have hle : upperYen <= x := Nat.le_of_not_gt h
    simp [h, hle]

end JapanTaxLaw.BatchStrictUppera405d0d3e9
