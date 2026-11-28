import JapanTaxLaw.ReducedRetailSalesAllocation

/-! # ReducedRetailSalesAllocation spec — 独立定式 (law 363AC0000000108 / art.38)

割合適用を `num * total / den`、二つの換算を独立した補助関数で再記述する。
実装の識別子は使わない。 -/

namespace JapanTaxLaw.ReducedRetailSalesAllocation

def specWithin (sales : Nat) : Bool := sales <= 50_000_000

def specShare (total : Nat) (num : Nat) (den : Nat) : Nat :=
  if den = 0 then 0 else num * total / den

def specReduced (total : Nat) (num : Nat) (den : Nat) : Nat :=
  specShare total num den * 100 / 108

def specOther (total : Nat) (num : Nat) (den : Nat) : Nat :=
  (total - specShare total num den) * 100 / 110

example : specWithin 50_000_000 = true := by decide
example : specWithin 50_000_001 = false := by decide
example : specReduced 1_080_000 1 1 = 1_000_000 := by decide
example : specOther 1_100_000 0 1 = 1_000_000 := by decide

theorem cap_agrees (sales : Nat) : withinCap sales = specWithin sales := by
  rfl

theorem reduced_agrees (total : Nat) (num : Nat) (den : Nat) :
    reducedBase total num den = specReduced total num den := by
  unfold reducedBase reducedAmount specReduced specShare
  by_cases h : den = 0
  · simp [h]
  · simp [h]
    rw [Nat.mul_comm total num]

theorem other_agrees (total : Nat) (num : Nat) (den : Nat) :
    otherBase total num den = specOther total num den := by
  unfold otherBase reducedAmount specOther specShare
  by_cases h : den = 0
  · simp [h]
  · simp [h]
    rw [Nat.mul_comm total num]

end JapanTaxLaw.ReducedRetailSalesAllocation
